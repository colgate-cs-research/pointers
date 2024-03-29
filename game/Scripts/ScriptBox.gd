extends TextEdit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal run_full_script(origin)
signal run_test_script(origin)

signal run_complete()

signal export_code(code_text, test_mode)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _setup_autocode(level_data : LevelData):
	if level_data.pre_code != "":
		text += "//Pre code\n"
	text += level_data.pre_code
	if level_data.pre_code != "":
		text += "\n//End Pre code\n"
	text += "\n//TODO: YOUR CODE HERE\n"
	if level_data.post_code != "":
		text += "\n//Post code\n"
	text += level_data.post_code
	if level_data.post_code != "":
		text += "\n//End post code"

func _on_TestButton_pressed():
	emit_signal("export_code", text, true)
	#emit_signal("run_test_script", self)

func _on_RunButton_pressed():
	emit_signal("export_code", text, false)
	#emit_signal("run_full_script", self)

func _evaluate_all(timer):
	for i in get_line_count():
		var line = get_line(i)
		_evaluate_line(line)
		await timer.timeout
	emit_signal("run_complete")

func _evaluate_all_fast():
	for i in get_line_count():
		var line = get_line(i)
		_evaluate_line(line)
	emit_signal("run_complete")

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
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\< ?(?<name>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("composition_from_variable", result.get_string("variable"),  result.get_string("name"))
		return;
	#Compose from pointer
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\< ?\\*(?<pointer>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("composition_from_pointer", result.get_string("variable"),  result.get_string("pointer"))
		return;
	
	#Cut from raw shape
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\> ?\\!(?<shape>[10 ]+);$")
	result = parse.search(text)
	if result:
		emit_signal("cut_from_shape", result.get_string("variable"),  result.get_string("shape"))
		return;
	#Cut from variable
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\> ?(?<name>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("cut_from_variable", result.get_string("variable"),  result.get_string("name"))
		return;
	#Cut from pointer
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\> ?\\*(?<pointer>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("cut_from_pointer", result.get_string("variable"),  result.get_string("pointer"))
		return;
	
	#Assign pointed var to shape
	parse.compile("^\\*(?<pointer>[a-z\\_\\d]+) ?\\=\\= ?\\!(?<shape>[10 ]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_pointer_to_shape", result.get_string("pointer"),  result.get_string("shape"))
		return;
	#Assign pointer var to variable
	parse.compile("^\\*(?<pointer>[a-z\\_\\d]+) ?\\=\\= ?(?<variable>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_pointer_to_variable", result.get_string("pointer"),  result.get_string("variable"))
		return;
	#Assign pointed var to other pointed var
	parse.compile("^\\*(?<pointer>[a-z\\_\\d]+) ?\\=\\= ?\\*(?<target>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_pointer_to_pointer", result.get_string("pointer"),  result.get_string("target"))
		return;
	
	#Assign variable to shape
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\=\\= ?\\!(?<shape>[10 ]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_variable_to_shape", result.get_string("variable"),  result.get_string("shape"))
		return;
	#Assign variable to other variable
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\=\\= ?(?<target>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_variable_to_variable", result.get_string("variable"),  result.get_string("target"))
		return;
	#Assign variable to pointed var
	parse.compile("^(?<variable>[a-z\\_\\d]+) ?\\=\\= ?\\*(?<pointer>[a-z\\_\\d]+);$")
	result = parse.search(text)
	if result:
		emit_signal("set_variable_to_pointer", result.get_string("variable"),  result.get_string("pointer"))
		return;
