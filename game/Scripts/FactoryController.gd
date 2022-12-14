extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = preload("res://Scenes/Shape.tscn")
var pointer = preload("res://Scenes/LaserPointer.tscn")
var dock = preload("res://Scenes/ShapeDock.tscn")

func _instance_shape_to_game(setup_string, dock):
	var instance = shape.instance()
	add_child(instance)
	instance._setup_shape(setup_string, dock)
	instance.position = dock.position
	dock._set_shape(instance)

func _setup_factory(inputs, outputs, variables, pointers):
	for i in inputs:
		var instance = dock.instance()
		add_child(instance)
		instance.position.x = i * 72 + 72
		instance.position.y = 72
		instance.name = "input_" + str(i)
		instance._setup_dock("input")
	for i in outputs:
		var instance = dock.instance()
		add_child(instance)
		instance.position.x = rect_size.x - 72 - i * 72
		instance.position.y = 72
		instance.name = "output_" + str(i)
		instance._setup_dock("output")
	for i in variables:
		var instance = dock.instance()
		add_child(instance)
		instance.position.x = rect_size.x / 2 - float((variables - 1)/ float(2)) * 72 + 72 * i
		instance.position.y = rect_size.y - 72
		instance.name = "variable_" + str(i)
		instance._setup_dock("storage")
	for i in pointers:
		var instance = pointer.instance()
		add_child(instance)
		instance.position.x = rect_size.x / 2 - float((pointers - 1)/ float(2)) * 80 + 80 * i
		instance.position.y = rect_size.y / 2
		instance.name = "pointer_" + str(i)
		instance._setup_pointer()

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

func _point_pointer_to(pointer, target):
	pointer._point_at(target)

func _dereference_pointer(pointer, target):
	pointer._dereference(target)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_MainUI_pointer_at_address(pointer, target):
	if get_node_or_null(pointer) == null || (pointer as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(target) == null || !["input", "output", "variable"].has((target as String).split("_")[0]):
		return
	_point_pointer_to(get_node_or_null(pointer), get_node_or_null(target))

func _on_MainUI_pointer_at_pointer(pointer, target):
	if get_node_or_null(pointer) == null || (pointer as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(target) == null || (pointer as String).split("_")[0] != "pointer":
		return
	_point_pointer_to(get_node_or_null(pointer), get_node_or_null(target)._get_target())

func _on_MainUI_composition_from_shape(variable, shape_data):
	if get_node_or_null(variable) == null || (variable as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	var generated = shape.instance()
	generated._setup_shape(shape_data, null)
	get_node_or_null(variable)._get_shape()._compose_shape(generated)
	
func _on_MainUI_composition_from_pointer(variable, pointer):
	if get_node_or_null(variable) == null || (variable as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	if get_node_or_null(pointer) == null || get_node_or_null(pointer)._get_target() == null || get_node_or_null(pointer)._get_target()._get_shape() == null:
		return
	get_node_or_null(variable)._get_shape()._compose_shape(get_node_or_null(pointer)._get_target()._get_shape())

func _on_MainUI_composition_from_variable(variable, target):
	if get_node_or_null(variable) == null || (target as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	if get_node_or_null(target) == null || get_node_or_null(target)._get_shape() == null:
		return
	get_node_or_null(variable)._get_shape()._compose_shape(get_node_or_null(target)._get_shape())

func _on_MainUI_cut_from_shape(variable, shape_data):
	if get_node_or_null(variable) == null || (variable as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	var generated = shape.instance()
	generated._setup_shape(shape_data, null)
	get_node_or_null(variable)._get_shape()._cut_shape(generated)

func _on_MainUI_cut_from_pointer(variable, pointer):
	if get_node_or_null(variable) == null || (variable as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	if get_node_or_null(pointer) == null || get_node_or_null(pointer)._get_target() == null || get_node_or_null(pointer)._get_target()._get_shape() == null:
		return
	get_node_or_null(variable)._get_shape()._cut_shape(get_node_or_null(pointer)._get_target()._get_shape())

func _on_MainUI_cut_from_variable(variable, target):
	if get_node_or_null(variable) == null || (target as String).split("_")[0] != "variable":
		return
	if get_node_or_null(variable)._get_shape() == null:
		return
	if get_node_or_null(target) == null || get_node_or_null(target)._get_shape() == null:
		return
	get_node_or_null(variable)._get_shape()._cut_shape(get_node_or_null(target)._get_shape())

func _on_MainUI_has_at_pointer(pointer, index):
	pass # Replace with function body.

func _on_MainUI_has_at_variable(variable, index):
	pass # Replace with function body.

func _on_MainUI_set_pointer_to_pointer(destination, pointer):
	if get_node_or_null(pointer) == null || (pointer as String).split("_")[0] != "pointer" || get_node_or_null(pointer)._get_target() == null || get_node_or_null(pointer)._get_target()._get_shape() == null:
		return
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(destination)._get_target()._get_shape() != null:
		get_node_or_null(destination)._get_target()._get_shape().queue_free()
	_dereference_pointer(get_node_or_null(pointer), get_node_or_null(destination)._get_target())
	_instance_shape_to_game(get_node_or_null(pointer)._get_target()._get_shape()._get_shape_data_encoding(), get_node_or_null(destination)._get_target())
	
func _on_MainUI_set_pointer_to_shape(destination, shape_data):
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(destination)._get_target()._get_shape() != null:
		get_node_or_null(destination)._get_target()._get_shape().queue_free()
	_dereference_pointer(get_node_or_null(pointer), get_node_or_null(destination)._get_target())
	_instance_shape_to_game(shape_data, get_node_or_null(destination)._get_target())

func _on_MainUI_set_pointer_to_variable(destination, variable):
	if get_node_or_null(variable) == null || !["input", "output", "variable"].has((variable as String).split("_")[0]):
		return
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(destination)._get_target()._get_shape() != null:
		get_node_or_null(destination)._get_target()._get_shape().queue_free()
	_instance_shape_to_game(get_node_or_null(variable)._get_shape()._get_shape_data_encoding(), get_node_or_null(destination)._get_target())

func _on_MainUI_set_variable_to_pointer(destination, pointer):
	if get_node_or_null(pointer) == null || (pointer as String).split("_")[0] != "pointer":
		return
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "variable":
		return
	if get_node_or_null(destination)._get_shape() != null:
		get_node_or_null(destination)._get_shape().queue_free()
	_dereference_pointer(get_node_or_null(pointer), get_node_or_null(destination))
	_instance_shape_to_game(get_node_or_null(pointer)._get_target()._get_shape()._get_shape_data_encoding(), get_node_or_null(destination))

func _on_MainUI_set_variable_to_shape(destination, shape_data):
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "variable":
		return
	if get_node_or_null(destination)._get_shape() != null:
		get_node_or_null(destination)._get_shape().queue_free()
	_instance_shape_to_game(shape_data, get_node_or_null(destination))

func _on_MainUI_set_variable_to_variable(destination, variable):
	if get_node_or_null(variable) == null || !["input", "output", "variable"].has((variable as String).split("_")[0]):
		return
	if get_node_or_null(destination) == null || (destination as String).split("_")[0] != "variable":
		return
	if get_node_or_null(destination)._get_shape() != null:
		get_node_or_null(destination)._get_shape().queue_free()
	_instance_shape_to_game(get_node_or_null(variable)._get_shape()._get_shape_data_encoding(), get_node_or_null(destination))
