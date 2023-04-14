extends Control

signal log_to_logger(message)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = preload("res://Scenes/Shape.tscn")
var pointer = preload("res://Scenes/LaserPointer.tscn")
var dock = preload("res://Scenes/ShapeDock.tscn")

var main_memory_row_addr = 10
var stack_memory_row_addr = 4
var row_count = 9

var allocated_main_memory = []
var allocated_stack_memory = []

var base_offset = 10
var dock_size = 64
var dock_offset = 5
var shape_size = 128

func _instance_shape_to_game(setup_string, dock):
	var instance = shape.instantiate()
	instance._setup_shape(setup_string, dock)
	dock.add_child(instance)
	instance.position = Vector2(32,32)
	dock._set_shape(instance)

func _setup_memory():
	for i in main_memory_row_addr * row_count + 1:
		allocated_main_memory.append(false)
	for i in stack_memory_row_addr * row_count + 1:
		allocated_stack_memory.append(false)

func _next_available_addr_main(size : int):
	var index = -1
	var available_size = 0
	for i in allocated_main_memory.size():
		if !allocated_main_memory[i]:
			if index < 0:
				index = i
			available_size += 1
			if available_size > size:
				return index
		else:
			index = -1
			available_size = 0
	return -1

func _next_available_addr_stack(size : int):
	var index = -1
	var available_size = 0
	for i in allocated_stack_memory.size():
		if !allocated_stack_memory[i]:
			if index < 0:
				index = i
			available_size += 1
			if available_size > size:
				return index
		else:
			index = -1
			available_size = 0
	return -1

func _setup_factory(inputs, outputs, variables, pointers):
	_setup_memory()
	for i in inputs:
		_declare_new_variable("input", i)
	for i in outputs:
		_declare_new_variable("output", i)
	for i in variables:
		_declare_new_variable("variable", i)
	for i in pointers:
		_declare_new_pointer(i)

func _reset():
	var index = 0;
	for i in get_child_count():
		if get_node_or_null("pointer_" + str(index)) != null:
			get_node_or_null("pointer_" + str(index))._reset()
		if get_node_or_null("variable_" + str(index)) != null:
			get_node_or_null("variable_" + str(index))._reset()
		if get_node_or_null("input_" + str(index)) != null:
			get_node_or_null("input_" + str(index))._reset()
		if get_node_or_null("output_" + str(index)) != null:
			get_node_or_null("output_" + str(index))._reset()
		index += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _setup():
	var level_data : LevelData = get_node("/root/GameLevel").level_data
	_setup_factory(level_data.inputs, level_data.outputs, level_data.variables, level_data.pointers)
	var file = FileAccess.open("Parser/examples/level1.c", FileAccess.READ)
	var file_text = file.get_as_text()
	_write_c_file(file_text)

func _point_pointer_to(pointer, target):
	pointer._point_at(target)

func _dereference_pointer(pointer, target):
	pointer._dereference(target)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _run_external_parser():
	var output = []
	var path = ProjectSettings.globalize_path("user://parse_file.c")
	var outcome = OS.execute("python3", ["Parser/main.py", path], output, true)
	if outcome == OK:
		print(output[0])
		_parse_antlr_xml(output[0]);
	else:
		print(error_string(outcome))
		print(output)

func _parse_antlr_xml(result : String):
	var split = []
	split = result.split("\n")
	#Log all errors first
	while !split[0].begins_with("<statements>"):
		emit_signal("log_to_logger", "ERR>>" + split[0])
		split.remove_at(0)
		if split[0] == "<statements />":
			emit_signal("log_to_logger", "ERR>>No valid code.")
			return
	var xmlPackedByteArray = split[0].to_utf8_buffer()
	var parse_file = XMLParser.new()
	parse_file.open_buffer(xmlPackedByteArray)
	while parse_file.read() != ERR_FILE_EOF:
		match parse_file.get_node_name():
			"assignment":
				_eval_assignment_statement(parse_file)
			"declaration":
				_eval_declaration_statement(parse_file)

func _eval_assignment_statement(parse_file : XMLParser):
	match parse_file.get_named_attribute_value_safe("modifier"):
		"":
			#Skip to next element
			var target_var = parse_file.get_named_attribute_value_safe("varname")
			parse_file.read()
			#Skip expression tag (always present, no data)
			parse_file.read()
			match parse_file.get_node_name():
				"value":
					match parse_file.get_node_name():
						"variable":
							var source_var = parse_file.get_named_attribute_value_safe("name")
							match parse_file.get_named_attribute_value_safe("modifier"):
								"":
									_set_variable_to_variable(target_var, source_var)
									parse_file.read()
								"*":
									_set_variable_to_dereference(target_var, source_var)
									parse_file.read()
								"&":
									_set_variable_to_address(target_var, source_var)
									parse_file.read()
								_:
									emit_signal("log_to_logger", "ERR>>Unexpected modifier: " + parse_file.get_named_attribute_value_safe("modifier"))
									parse_file.read()
				"expression":
					pass
		"*":
			#Skip to next element
			var target_var = parse_file.get_named_attribute_value_safe("varname")
			parse_file.read()
			match parse_file.get_node_name():
				"variable":
					var source_var = parse_file.get_named_attribute_value_safe("name")
					match parse_file.get_named_attribute_value_safe("modifier"):
						"":
							_set_dereference_to_variable(target_var, source_var)
							parse_file.read()
						"*":
							_set_dereference_to_dereference(target_var, source_var)
							parse_file.read()
						"&":
							emit_signal("log_to_logger", "ERR>>Bad modifier. Cannot CURRENTLY set dereference to address (wait for double pointer implementation)")
							parse_file.read()
						_:
							emit_signal("log_to_logger", "ERR>>Unexpected modifier: " + parse_file.get_named_attribute_value_safe("modifier"))
							parse_file.read()
		"&":
			emit_signal("log_to_logger", "ERR>>Bad modifier. Cannot manually set address of variable or pointer")
			parse_file.read()
		_:
			emit_signal("log_to_logger", "ERR>>Unexpected modifier: " + parse_file.get_named_attribute_value_safe("modifier"))
			parse_file.read()

func _eval_declaration_statement(parse_file : XMLParser):
	match parse_file.get_named_attribute_safe("modifier"):
		"":
			pass
		"*":
			pass

func _eval_expression(parse_file):
	pass

func _eval_value_expression(parse_file : XMLParser):
	pass

func _eval_variable_expression(parse_file : XMLParser):
	pass

func _declare_new_variable(type, index):
	var instance = dock.instantiate()
	add_child(instance)
	instance.name = type + "_" + str(index)
	var addr = _next_available_addr_main(1)
	if addr == -1:
		emit_signal("log_to_logger", "ERR>>Insufficient space in main memory for new variable")
		return
	instance.position = Vector2((addr % main_memory_row_addr) * (dock_size + dock_offset) + base_offset, floor(float(addr) / main_memory_row_addr) * (dock_size + dock_offset) + base_offset)
	allocated_main_memory[addr] = true
	var protected = false
	match type:
		"input", "output":
			protected = true
		"variable":
			protected = false
	instance._setup_dock(type, addr, protected)

func _declare_new_pointer(index):
	var instance = pointer.instantiate()
	add_child(instance)
	instance.name = "pointer_" + str(index)
	var addr = _next_available_addr_main(1)
	if addr == -1:
		emit_signal("log_to_logger", "ERR>>Insufficient space in main memory for new variable")
		return
	instance.position = Vector2((addr % main_memory_row_addr) * (dock_size + dock_offset) + base_offset, floor(float(addr) / main_memory_row_addr) * (dock_size + dock_offset) + base_offset)
	allocated_main_memory[addr] = true
	instance._setup_pointer()

func _set_variable_to_variable(target, source):
	if get_node_or_null(target) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
		return
	if get_node_or_null(source) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + source)
		return
	var source_node = get_node(source)
	var target_node = get_node(target)
	if target_node._variable_type() == "variable" and target_node._is_protected():
		emit_signal("log_to_logger", "ERR>>Variable is protected: " + target + "\nTry using a pointer to set this variable")
		return
	if target_node._variable_type() != source_node._variable_type():
		emit_signal("log_to_logger", "ERR>>Incongrouous types. Attempting to assign pointer value to variable or variable to pointer value")
		return
	
	if target_node._variable_type() == "pointer":
		target_node._point_at(source_node._get_target())
	elif target_node._variable_type() == "variable":
		if target_node._get_shape() != null:
			target_node._get_shape().queue_free()
		_instance_shape_to_game(source_node._get_shape()._get_shape_data_encoding(), target_node)

func _set_variable_to_dereference(target, source):
	if get_node_or_null(target) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
		return
	if get_node_or_null(source) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + source)
		return
	var source_node = get_node(source)
	var target_node = get_node(target)
	if target_node._variable_type() == "variable" and target_node._is_protected():
		emit_signal("log_to_logger", "ERR>>Variable is protected: " + target + "\nTry using a pointer to set this variable")
		return
	if target_node._variable_type() != "variable":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot set pointer address to shape")
		return
	if source_node._variable_type() != "pointer":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot dereference a variable")
		return
	
	source_node._dereference(target_node)
	if source_node._get_target()._get_shape() == null:
		target_node._set_shape(null)
	else:
		_instance_shape_to_game(source_node._get_target()._get_shape()._get_shape_data_encoding(), target_node)

func _set_variable_to_address(target, source):
	if get_node_or_null(target) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
		return
	if get_node_or_null(source) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + source)
		return
	var source_node = get_node(source)
	var target_node = get_node(target)
	if target_node._variable_type() != "pointer":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot set variable to address")
		return
	if source_node._variable_type() != "variable":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot CURRENTLY get address of a pointer (wait for double pointer implementation)")
		return
	
	target_node._point_at(source_node)

func _set_dereference_to_variable(target, source):
	if get_node_or_null(target) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
		return
	if get_node_or_null(source) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + source)
		return
	var source_node = get_node(source)
	var target_node = get_node(target)
	
	if target_node._variable_type() != "pointer":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot dereference a variable")
		return
	if source_node._variable_type() != "variable":
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot set dereference of pointer to address")
		return
	
	target_node._dereference(source_node)
	if source_node._get_shape() == null:
		target_node._get_target()._set_shape(null)
	else:
		_instance_shape_to_game(source_node._get_shape()._get_shape_data_encoding(), target_node._get_target())

func _set_dereference_to_dereference(target, source):
	if get_node_or_null(target) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
		return
	if get_node_or_null(source) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + source)
		return
	var source_node = get_node(source)
	var target_node = get_node(target)
	
	if target_node._variable_type() != "pointer" or target_node._variable_type() != "pointer" :
		emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot dereference a non-pointer")
		return
	source_node._dereference(target_node._get_target())
	if source_node._get_target()._get_shape() == null:
		target_node._set_shape(null)
	else:
		_instance_shape_to_game(source_node._get_target()._get_shape()._get_shape_data_encoding(), target_node._get_target())


func _write_c_file(text):
	var c_file = FileAccess.open("user://parse_file.c", FileAccess.WRITE)
	c_file.store_string(text)
	c_file.close()

func _on_export_code(code_text):
	_write_c_file(code_text)
	_run_external_parser()
