extends Node2D

onready var robotBase = preload("res://Robot.tscn")

var mem_id = int(rand_range(0,10))

#Key = variable name, value = variable value
var variable_dict = {}
#Key = variable address, value = variable name
var address_dict = {}
#Key = variable name, value = variable address
var reverse_dict = {}

#Probably better to use enum here, but haven't quite figured out the conversions
var valid_types = ["robot", "data", "item"]

func _add_variable(var_name, var_type):
	if !valid_types.has((var_type as String).get_slice("_", 0)):
		return "ERR>>noSuchType>>" + var_type
	if variable_dict.has(var_name):
		return "ERR>>varExists>>" + var_name
	variable_dict[var_name] = VariableData.new(var_type, null);
	address_dict[mem_id] = var_name;
	reverse_dict[var_name] = mem_id;
	mem_id += int(rand_range(0,10))
	return var_name + ":null"

func _set_variable(var_name, value, var_type):
	if variable_dict.has(var_name):
		if (variable_dict[var_name] as VariableData)._get_type() == var_type:
			if (variable_dict[var_name] as VariableData)._get_type() == "robot":
				var object = _create_robot(value)
				if object is String && (object as String).get_slice(">>", 0) == "ERR":
					return object
				else:
					if variable_dict[var_name]._get_value() != null:
						variable_dict[var_name]._get_value().queue_free()
					(variable_dict[var_name] as VariableData)._set_value(object)
			else:
				(variable_dict[var_name] as VariableData)._set_value(value)				
			return var_name + ":" + str(value)
		else:
			return "ERR>>mismatchType>>" + var_type + " expecting " + (variable_dict[var_name] as VariableData)._get_type()
	else:
		return "ERR>>noSuchVar>>"+var_name

func _get_address(var_name):
	if variable_dict.has(var_name):
		return reverse_dict[var_name]
	else:
		return "ERR>>noSuchVar>>"+var_name

func _get_value_from_variable(var_name):
	if variable_dict.has(var_name):
		return (variable_dict[var_name] as VariableData)._get_value()
	else:
		return "ERR>>noSuchVar>>"+var_name

func _get_value_from_address(address):
	if address_dict.has(address):
		return (variable_dict[address_dict[address]] as VariableData)._get_value()
	else:
		return "ERR>>noSuchAddr>>"+address

func _get_type_from_variable(var_name):
	if variable_dict.has(var_name):
		return (variable_dict[var_name] as VariableData)._get_type()
	else:
		return "ERR>>noSuchVar>>"+var_name

func _get_type_from_address(address):
	if address_dict.has(address):
		return (variable_dict[address_dict[address]] as VariableData)._get_type()
	else:
		return "ERR>>noSuchAddr>>"+address

func _run_command_on_variable(variable, command):
	if variable_dict.has(variable):
		if variable_dict[variable]._get_type() == "robot":
			if variable_dict[variable]._get_value()._is_valid_command(command):
				print("NOT IMPLEMENTED")
			else:
				return "ERR>>invalidCommand>>" + command
		else:
			return "ERR>>"

func _run_command_on_pointer(address, command):
	if address_dict.has(address):
		return _run_command_on_variable(address_dict[address], command)
	else:
		return "ERR>>noSuchAddr>>"+address

func _contains_variable(var_name):
	return variable_dict.has(var_name)

func _memory_summarize():
	print("summarize")
	for variable in variable_dict:
		print(variable + " type: " + str((variable_dict[variable] as VariableData)._get_type()) + " addr: " + str(reverse_dict[variable]) + " value: " + str((variable_dict[variable] as VariableData)._get_value()))

func _create_robot(encode):
	var strParse = RegEx.new()
	var numParse = RegEx.new()
	strParse.compile("^[A-Za-z]+$")
	numParse.compile("^[\\d]+$")
	var encoding = (encode as String).split(",", true)
	if (encoding.size() != 3 || !strParse.search(encoding[0]) || !numParse.search(encoding[1]) || !numParse.search(encoding[2])):
		return "ERR>>badConstructRobot>>" + encode
	var newObj = robotBase.instance()
	add_child(newObj)
	newObj.name = encoding[0]
	newObj._setup(int(encoding[1]), int(encoding[2]))
	newObj.position = Vector2(rand_range(0,1024),rand_range(0,600))
	return newObj

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

class VariableData:
	var type
	var value
	
	func _init(var_type, var_value):
		type = var_type
		value = var_value
	
	func _get_type():
		return type
	
	func _get_value():
		return value
	
	func _set_value(new_val):
		value = new_val
