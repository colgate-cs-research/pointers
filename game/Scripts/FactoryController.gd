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
var dock_offset = 20
var shape_size = 128

func _instance_shape_from_string(setup_string, dock):
	var instance = shape.instantiate()
	instance._setup_shape_string(setup_string)
	dock.add_child(instance)
	instance.position = Vector2(32,32)
	dock._set_shape(instance)

func _instance_shape_from_fragment(setup_fragment, dock):
	var instance = shape.instantiate()
	instance._setup_shape_fragment(setup_fragment)
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

func _setup_factory():
	_setup_memory()

func _reset():
	for i in get_children():
		if i is Node2D:
			remove_child(i)
			i.queue_free()
	for i in main_memory_row_addr * row_count + 1:
		allocated_main_memory[i] = false
	for i in stack_memory_row_addr * row_count + 1:
		allocated_stack_memory[i] = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _setup():
	var level_data : LevelData = get_node("/root/GameLevel").level_data
	_setup_factory()
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
		return output[0];
	else:
		print(error_string(outcome))
		for value in output:
			print(value)

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
	_eval_antlr_code(parse_file)

func _eval_antlr_code(parse_file : XMLParser):
	while parse_file.read() != ERR_FILE_EOF:
		while parse_file.get_node_type() == XMLParser.NODE_ELEMENT_END && !parse_file.is_empty():
			if parse_file.read() == ERR_FILE_EOF:
				break
		match parse_file.get_node_name():
			"assignment":
				_eval_assignment_statement(parse_file)
			"declaration":
				_eval_declaration_statement(parse_file)

func _eval_assignment_statement(parse_file : XMLParser):
	var target_var = parse_file.get_named_attribute_value_safe("varname")
	if get_node_or_null(target_var) == null:
		emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target_var)
		return
	var target_node = get_node(target_var)
	match parse_file.get_named_attribute_value_safe("modifier"):
		"":
			var result_val = _eval_expression(parse_file)
			match target_node._variable_type():
				"variable":
					if target_node._is_protected():
						emit_signal("log_to_logger", "ERR>>Variable is protected: " + target_node + "\nTry using a pointer to set this variable")
						return
					match result_val[1]:
						"value":
							if target_node._get_shape() == null:
								_instance_shape_from_string(result_val[0], target_node)
							else:
								target_node._get_shape()._setup_shape_string(result_val[0])
						"fragment":
							if target_node._get_shape() == null:
								_instance_shape_from_fragment(result_val[0], target_node)
							else:
								target_node._get_shape()._setup_shape_fragment(result_val[0])
						"address":
							emit_signal("log_to_logger", "ERR>>Cannot set variable to address")
						"errout":
							pass
						_:
							emit_signal("log_to_logger", "ERR>>Unexpected result from script evaluation: " + result_val)
				"pointer":
					print(result_val)
					match result_val[1]:
						"value":
							emit_signal("log_to_logger", "ERR>>Cannot set pointer address to shape")
						"fragment":
							emit_signal("log_to_logger", "ERR>>Cannot set pointer address to shape fragment")
						"address":
							_point_pointer_to(target_node, get_node(result_val[0]))
						"errout":
							pass
						_:
							emit_signal("log_to_logger", "ERR>>Unexpected result from script evaluation: " + result_val[0])
		"*":
			var result_val = _eval_expression(parse_file)
			match target_node._variable_type():
				"variable":
					emit_signal("log_to_logger", "ERR>>Cannot dereference a variable: " + result_val[0])
				"pointer":
					if target_node._get_target() == null:
						emit_signal("log_to_logger", "ERR>>Null Pointer Exception: " + target_node + " value is null")
					match result_val[1]:
						"value":
							if target_node._get_target()._get_shape() == null:
								_instance_shape_from_string(result_val[0], target_node)
							else:
								target_node._get_target()._get_shape()._setup_shape_string(result_val[0])
						"fragment":
							if target_node._get_target()._get_shape() == null:
								_instance_shape_from_fragment(result_val[0], target_node)
							else:
								target_node._get_target()._get_shape()._setup_shape_fragment(result_val[0])
						"address":
							emit_signal("log_to_logger", "ERR>>Cannot set variable to address")
						"errout":
							pass
						_:
							emit_signal("log_to_logger", "ERR>>Unexpected result from script evaluation: " + result_val)
		"&", "&amp;":
			emit_signal("log_to_logger", "ERR>>Bad modifier. Cannot manually set address of variable or pointer")
			parse_file.read()
		_:
			emit_signal("log_to_logger", "ERR>>Unexpected modifier: " + parse_file.get_named_attribute_value_safe("modifier"))
			parse_file.read()

func _eval_declaration_statement(parse_file : XMLParser):
	match parse_file.get_named_attribute_value_safe("modifier"):
		"":
			var protected = false
			if parse_file.get_named_attribute_value_safe("protect") == "True":
				protected = true
			var new_var = _declare_new_variable(parse_file.get_named_attribute_value_safe("varname"), protected)
			if not parse_file.is_empty():
				var initial_val = _eval_expression(parse_file)
				match initial_val[1]:
					"value":
						_instance_shape_from_string(initial_val[0], new_var)
					"fragment":
						_instance_shape_from_fragment(initial_val[0], new_var)
					"address":
						emit_signal("log_to_logger", "ERR>>Cannot set variable to address")
					"errout":
						pass
					_:
						emit_signal("log_to_logger", "ERR>>Unexpected result from script evaluation: " + initial_val)
		"*":
			var new_ptr = _declare_new_pointer(parse_file.get_named_attribute_value_safe("varname"))
			if not parse_file.is_empty():
				var initial_val = _eval_expression(parse_file)
				match initial_val[1]:
					"value":
						emit_signal("log_to_logger", "ERR>>Cannot set pointer address to shape")
					"fragment":
						emit_signal("log_to_logger", "ERR>>Cannot set pointer address to shape fragment")
					"address":
						_point_pointer_to(new_ptr, get_node(initial_val[0]))
					"errout":
						pass
					_:
						emit_signal("log_to_logger", "ERR>>Unexpected result from script evaluation: " + initial_val)
		_:
			emit_signal("log_to_logger", "ERR>>Unexpected modifier: " + parse_file.get_named_attribute_value_safe("modifier"))

func _eval_expression(parse_file : XMLParser):
	#Skip to next element
	parse_file.read()
	match parse_file.get_node_name():
		"expression":
			#TODO: Handle chaining
			return _eval_expression(parse_file)
		"value":
			return _eval_value_expression(parse_file)

func _eval_value_expression(parse_file : XMLParser):
	#Skip to next element
	parse_file.read()
	match parse_file.get_node_name():
		"shape":
			return _eval_shape_expression(parse_file)
		"variable":
			return _eval_variable_expression(parse_file)
		"function":
			return _eval_function_expression(parse_file)

func _eval_variable_expression(parse_file : XMLParser):
	var target = parse_file.get_named_attribute_value_safe("varname")
	match parse_file.get_named_attribute_value_safe("modifier"):
		"":
			if get_node_or_null(target) == null:
				emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
				return [null, "errout"]
			var target_node = get_node(target)
			if target_node._variable_type() == "variable" and target_node._is_protected():
				emit_signal("log_to_logger", "ERR>>Variable is protected: " + target + "\nTry using a pointer to set this variable")
				return [null, "errout"]
			match target_node._variable_type():
				"variable":
					if target_node._get_shape() == null:
						emit_signal("log_to_logger", "WRN>>Variable " + target + " value is null")
						return [null, "value"]
					return [target_node._get_shape()._get_shape_data_encoding(), "value"]
				"pointer":
					if target_node._get_target() == null:
						emit_signal("log_to_logger", "WRN>>Pointer " + target + " value is null")
						return [null, "address"]
					return [String(target_node._get_target().name), "address"]
		"*":
			if get_node_or_null(target) == null:
				emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
				return [null, "errout"]
			var target_node = get_node(target)
			match target_node._variable_type():
				"variable":
					emit_signal("log_to_logger", "ERR>>Impossible operation. Cannot dereference a variable")
					return [null, "errout"]
				"pointer":
					if target_node._get_target() == null:
						emit_signal("log_to_logger", "ERR>>Null Pointer Exception: " + target + " value is null")
						return [null, "errout"]
					if target_node._get_target()._get_shape() == null:
						emit_signal("log_to_logger", "WRN>>Dereference of " + target + " value is null")
						return [null, "value"]
					return [target_node._get_target()._get_shape()._get_shape_data_encoding(), "value"]
		"&", "&amp;":
			if get_node_or_null(target) == null:
				emit_signal("log_to_logger", "ERR>>Variable does not exist: " + target)
				return [null, "errout"]
			var target_node = get_node(target)
			return [String(target_node.name), "address"]

func _eval_shape_expression(parse_file : XMLParser):
	return [parse_file.get_named_attribute_value_safe("value"), "fragment"]

func _eval_function_expression(parse_file : XMLParser):
	var name = parse_file.get_named_attribute_value_safe("funcname")
	name = name.left(-2)
	match name:
		"generateShape":
			return [null, "errout"]
		_:
			return [null, "errout"]

func _declare_new_variable(varname, protected):
	var addr = _next_available_addr_main(1)
	if addr == -1:
		emit_signal("log_to_logger", "ERR>>Insufficient space in main memory for new variable")
		return null
	if get_node_or_null(varname) != null:
		emit_signal("log_to_logger", "ERR>>Variable already exists")
		return null
	var instance = dock.instantiate()
	instance.name = varname
	instance.position = Vector2((addr % main_memory_row_addr) * (dock_size + dock_offset) + base_offset, floor(float(addr) / main_memory_row_addr) * (dock_size + dock_offset) + base_offset)
	allocated_main_memory[addr] = true
	var type = varname.split("_")
	match type[0]:
		"input", "output":
			type = type[0]
		_:
			type = "variable"
	instance._setup_dock(type, addr, protected)
	add_child(instance)
	return instance

func _declare_new_pointer(varname):
	var addr = _next_available_addr_main(1)
	if addr == -1:
		emit_signal("log_to_logger", "ERR>>Insufficient space in main memory for new variable")
		return null
	var instance = pointer.instantiate()
	instance.name = varname
	instance.position = Vector2((addr % main_memory_row_addr) * (dock_size + dock_offset) + base_offset, floor(float(addr) / main_memory_row_addr) * (dock_size + dock_offset) + base_offset)
	allocated_main_memory[addr] = true
	instance._setup_pointer()
	add_child(instance)
	return instance

func _write_c_file(text):
	var c_file = FileAccess.open("user://parse_file.c", FileAccess.WRITE)
	c_file.store_string(text)
	c_file.close()

func _on_export_code(code_text):
	_write_c_file(code_text)
	_reset()
	var xml_string = _run_external_parser()
	_parse_antlr_xml(xml_string)
