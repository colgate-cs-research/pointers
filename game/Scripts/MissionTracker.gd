extends Node

onready var logger = get_node("../MainUI/CommandLog")
onready var factory = get_node("../FactoryBase")
var shape = preload("res://Scenes/Shape.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _generate_shape_string():
	var string = ""
	for i in 7:
		string += str(randi() % 2) + " "
	string += str(randi() % 2)
	return string


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
