extends Node

onready var logger = get_node("../MainUI/CommandLog")
onready var factory = get_node("../FactoryBase")
var shape = preload("res://Scenes/Shape.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var shape_string = "0 0 0 0 0 0 0 0"

# Called when the node enters the scene tree for the first time.
func _ready():
	factory._instance_shape_to_game(_generate_shape_string(), factory.get_node("input_0"))

func _generate_shape_string():
	var string = ""
	for i in 7:
		string += str(randi() % 2) + " "
	string += str(randi() % 2)
	shape_string = string
	return string

func _validate_shape_string(output, operation):
	match operation:
		"cut_left":
			if output == null:
				return
			var instance = shape.instance()
			var half = shape.instance()
			half._setup_shape("0 0 1 1 0 0 1 1", null)
			instance._setup_shape(shape_string, null)
			return output._compare_shape(instance._cut_shape(half))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _validate_shape_string(factory.get_node("output_0")._get_shape(), "cut_left"):
		logger._log_to_label("Shape passed! Generating new shape...")
		factory._instance_shape_to_game(_generate_shape_string(), factory.get_node("input_0"))
