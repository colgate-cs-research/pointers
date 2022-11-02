extends TextEdit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal pointer_at_address(pointer, target)
signal pointer_at_pointer(pointer, target)
signal composition_from_variable(pointer, target)
signal composition_from_pointer(pointer, target)
signal composition_from_shape(pointer, shape)
signal cut_from_variable(pointer, target)
signal cut_from_pointer(pointer, target)
signal cut_from_shape(pointer, shape)
signal has_at_pointer(pointer, index)
signal has_at_shape(pointer, index)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RunButton_pressed():
	for i in get_line_count():
		var line = get_line(i)
		_evaluate_line(line)

func _evaluate_line(text):
	var parse = RegEx.new()
	var result
	
	#Pointer at address
	parse.compile("^(?<pointer>[a-z\\_\\d]+) ?= ?&(?<name>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("pointer_at_address", result.get_string("pointer"),  result.get_string("name"))
		return;

	#Pointer at pointer
	parse.compile("^(?<pointer>[a-z\\_\\d]+) ?= ?(?<name>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("pointer_at_pointer", result.get_string("pointer"),  result.get_string("name"))
		return;

	#Compose from raw shape
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\< ?\\!(?<shape>[10 ]+);$")
	result = parse.search(text)
	if result:
		emit_signal("composition_from_shape", result.get_string("variable"),  result.get_string("shape"))
		return;

	#Compose from variable
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?= ?(?<name>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("composition_from_variable", result.get_string("variable"),  result.get_string("name"))
		return;

	#Compose from pointer
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?= ?\\*(?<pointer>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("composition_from_pointer", result.get_string("variable"),  result.get_string("pointer"))
		return;
