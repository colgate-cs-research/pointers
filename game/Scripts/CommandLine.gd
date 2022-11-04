extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var logger = get_node("../CommandLog")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CommandLine_text_entered(new_text):
	if new_text.length() > 0:
		self.clear()
	logger._log_to_label(new_text)
	regex_parse(new_text)
	

func regex_parse(text):
	var parse = RegEx.new()
	var result
	
	#Check for composition
	parse.compile("^(?<type>[a-z\\d]+)\\* ?(?<name>[A-Za-z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._add_variable(result.get_string("name"), result.get_string("type") + "_pointer"))
		return;
	
	#Check for pointer
	parse.compile("^(?<type>[a-z\\d]+)\\* ?(?<name>[A-Za-z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._add_variable(result.get_string("name"), result.get_string("type") + "_pointer"))
		return;
	#Check for standard variable
	parse.compile("^(?<type>[a-z\\d]+) ?(?<name>[A-Za-z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._add_variable(result.get_string("name"), result.get_string("type")))
		return;
	#Check for pointer address assignment
	parse.compile("^(?<pointer>[a-zA-Z\\d]+) ?= ?&(?<variable>[a-zA-Z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._set_variable(result.get_string("pointer"), MainMemory._get_address(result.get_string("variable")), MainMemory._get_type_from_variable(result.get_string("variable")) + "_pointer"))
		return;
	#Check for pointer value assignment by variable
	parse.compile("^\\*(?<pointer>[a-zA-Z\\d]+) ?= ?(?<variable>[a-zA-Z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._deref_variable(result.get_string("pointer"), result.get_string("variable"), MainMemory._get_type_from_variable(result.get_string("variable"))))
		return;
	#Check for pointer value assignment by other pointer value
	parse.compile("^\\*(?<pointer1>[a-zA-Z\\d]+) ?= ?\\*(?<pointer2>[a-zA-Z\\d]+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._set_variable(result.get_string("pointer1"), MainMemory._get_value_from_address(result.get_string("pointer2")), MainMemory._get_type_from_address(result.get_string("pointer2"))))
		return;
	#Check for pointer address assignment by other pointer
	parse.compile("^(?<pointer1>[a-zA-Z\\d]+) ?= ?(?<pointer2>[a-zA-Z\\d]+);$")
	result = parse.search(text)
	if result && str(MainMemory._get_type_from_variable(result.get_string("pointer2"))).ends_with("_pointer"):
		logger._log_to_label(MainMemory._set_variable(result.get_string("pointer1"), MainMemory._get_value_from_variable(result.get_string("pointer2")), MainMemory._get_type_from_variable(result.get_string("pointer2"))))
		return;
	#Check for variable assignment to other variable
	parse.compile("^(?<variable1>[a-zA-Z\\d]+) ?= ?(?<variable2>[a-zA-Z\\d]+);$")
	result = parse.search(text)
	if result && MainMemory._contains_variable(result.get_string("variable2")):
		logger._log_to_label(MainMemory._set_variable(result.get_string("variable1"), MainMemory._get_value_from_variable(result.get_string("variable2")), MainMemory._get_type_from_variable(result.get_string("variable2"))))
		return;
	#Check for basic variable assignment
	parse.compile("^(?<variable>[a-zA-Z\\d]+) ?= ?(?<value>.+);$")
	result = parse.search(text)
	if result:
		logger._log_to_label(MainMemory._set_variable(result.get_string("variable"), result.get_string("value"), MainMemory._get_type_from_variable(result.get_string("variable"))))
		return;
	logger._log_to_label("ERR>>noSuchCommand>>" + text)