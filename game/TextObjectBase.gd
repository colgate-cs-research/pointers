extends Node

var content = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func _run_command(function, params):
	if function == "->":
		return _get_content()
	if function == "<-":
		return _set_content(params)
	if function == "-+":
		return _add_content(params)
	return "ERR>>noSuchCommand>>" + function

func _get_content():
	return content

func _set_content(params):
	content = params
	return content

func _add_content(params):
	content = content + params
	return content

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
