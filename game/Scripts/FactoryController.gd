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
		instance.position.x = i * 60 + 60
		instance.position.y = 60
		instance.name = "input_" + str(i)
		instance._setup_dock("input")
	for i in outputs:
		var instance = dock.instance()
		add_child(instance)
		instance.position.x = rect_size.x - 60 - i * 60
		instance.position.y = 60
		instance.name = "output_" + str(i)
		instance._setup_dock("output")
	for i in variables:
		var instance = dock.instance()
		add_child(instance)
		instance.position.x = rect_size.x / 2 - float((variables - 1)/ float(2)) * 60 + 60 * i
		instance.position.y = rect_size.y - 60
		instance.name = "variable_" + str(i)
		instance._setup_dock("storage")
	for i in pointers:
		var instance = pointer.instance()
		add_child(instance)
		instance.position.x = rect_size.x / 2 - float((pointers - 1)/ float(2)) * 80 + 80 * i
		instance.position.y = rect_size.y / 2
		instance.name = "pointer_" + str(i)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	_setup_factory(3, 3, 5, 2)
	_instance_shape_to_game("0 0 1 0 1 0 1 0", get_node("variable_0"))
	_instance_shape_to_game("1 1 0 1 0 1 0 1", get_node("variable_1"))
	_instance_shape_to_game("0 1 1 0 0 1 1 0", get_node("variable_2"))
	_instance_shape_to_game("0 0 0 0 0 0 0 0", get_node("variable_3"))
	_instance_shape_to_game("1 1 1 1 1 1 1 1", get_node("variable_4"))
	pass # Replace with function body.

func _next():
	pass

func _point_pointer_to(pointer, target):
	pointer._point_at(target)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_MainUI_pointer_at_address(pointer, target):
	if get_node(pointer) == null || (pointer as String).split("_")[0] != "pointer":
		return
	if get_node(target) == null || !["input", "output", "variable"].has((target as String).split("_")[0]):
		return
	_point_pointer_to(get_node(pointer), get_node(target))

func _on_MainUI_pointer_at_pointer(pointer, target):
	if get_node(pointer) == null || (pointer as String).split("_")[0] != "pointer":
		return
	if get_node(target) == null || (pointer as String).split("_")[0] != "pointer":
		return
	_point_pointer_to(get_node(pointer), get_node(target)._get_target())

func _on_MainUI_composition_from_shape(variable, shape_data):
	if get_node(variable) == null || (pointer as String).split("_")[0] != "variable":
		return
	if get_node(variable)._get_shape() == null:
		return
	var generated = shape.instance()
	generated._setup_shape(shape_data, null)
	get_node(variable)._get_shape()._compose_shape(generated)
	
func _on_MainUI_composition_from_pointer(variable, pointer):
	if get_node(variable) == null || (pointer as String).split("_")[0] != "variable":
		return
	if get_node(variable)._get_shape() == null:
		return
	if get_node(pointer) == null || get_node(pointer)._get_shape() == null:
		return
	get_node(variable)._get_shape()._compose_shape(get_node(pointer)._get_target())

func _on_MainUI_composition_from_variable(variable, target):
	if get_node(variable) == null || (pointer as String).split("_")[0] != "variable":
		return
	if get_node(variable)._get_shape() == null:
		return
	if get_node(target) == null || get_node(target)._get_shape() == null:
		return
	get_node(variable)._get_shape()._compose_shape(get_node(target))
