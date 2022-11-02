extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal pointer_at_address(pointer, target)
signal pointer_at_pointer(pointer, target)
signal composition_from_variable(variable, target)
signal composition_from_pointer(variable, target)
signal composition_from_shape(variable, shape)
signal cut_from_variable(variable, target)
signal cut_from_pointer(variable, target)
signal cut_from_shape(variable, shape)
signal has_at_pointer(variable, index)
signal has_at_shape(variable, index)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ScriptBox_pointer_at_pointer(pointer, target):
	emit_signal("pointer_at_pointer", pointer, target)

func _on_ScriptBox_pointer_at_address(pointer, target):
	emit_signal("pointer_at_address", pointer, target)

func _on_ScriptBox_composition_from_shape(variable, shape):
	emit_signal("composition_from_shape", variable, shape)

func _on_ScriptBox_composition_from_pointer(variable, pointer):
	emit_signal("composition_from_pointer", variable, pointer)

func _on_ScriptBox_composition_from_variable(variable, target):
	emit_signal("composition_from_variable", variable, target)
