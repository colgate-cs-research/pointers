extends Node

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

func _contains_variable(var_name):
	return variable_dict.has(var_name)

func _memory_summarize():
	print("summarize")
	for variable in variable_dict:
		print(variable + " type: " + str((variable_dict[variable] as VariableData)._get_type()) + " addr: " + str(reverse_dict[variable]) + " value: " + str((variable_dict[variable] as VariableData)._get_value()))

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
