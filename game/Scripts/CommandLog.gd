extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _log_to_label(message):
	if (message as String).get_slice(">>", 0) == "ERR":
		append_text("[color=red]" + message + "[/color]\n")
	elif (message as String).get_slice(">>", 0) == "WRN":
		append_text("[color=yellow]" + message + "[/color]\n")
	else:
		append_text(message + "\n")

func _clear():
	clear()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
