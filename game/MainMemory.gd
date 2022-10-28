extends Node2D

var mem_id = int(rand_range(0,10))
const text_object = preload("res://TextObjectBase.gd")

#Key = variable name, value = variable value
var variable_dict = {}
#Key = variable address, value = variable name
var address_dict = {}
#Key = variable name, value = variable address
var reverse_dict = {}

#Probably better to use enum here, but haven't quite figured out the conversions
var valid_types = ["text"]

func _add_variable(var_name, var_type):
	if !valid_types.has((var_type as String).get_slice("_", 0)):
		return "ERR>>noSuchType>>" + var_type
	if variable_dict.has(var_name):
		return "ERR>>varExists>>" + var_name
	if var_type == "text":
		variable_dict[var_name] = VariableData.new(var_type, text_object.new());
	else:
		variable_dict[var_name] = VariableData.new(var_type, null);
	address_dict[mem_id] = var_name;
	reverse_dict[var_name] = mem_id;
	mem_id += int(rand_range(1,10))
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

func _deref_variable(ptr_name, value, var_type):
	var address = null
	if variable_dict.has(ptr_name):
		address = (variable_dict[ptr_name] as VariableData)._get_value()
		if address == null:
			return "ERR>>nullPointer>>" + ptr_name
	else:
		return "ERR>>noSuchVar>>" + ptr_name
	if address_dict.has(address):
		if variable_dict.has(value):
			if (variable_dict[_get_var(address)] as VariableData)._get_type() == var_type:
				(variable_dict[_get_var(address)] as VariableData)._set_value((variable_dict[value] as VariableData)._get_value())
				return _get_var(address) + ":" + str(value)
			else:
				return "ERR>>mismatchType>>" + var_type + " expecting " + (variable_dict[_get_var(address)] as VariableData)._get_type()
		else:
			return "ERR>>noSuchVar>>" + value
	else:
		return "ERR>>noSuchAddr>>" + address

func _get_var(address):
	if address_dict.has(address):
		return address_dict[address]
	else:
		return "ERR>>noSuchAddr>>"+address

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

func _run_command(var_name, function, params):
	if variable_dict.has(var_name):
		return "~>" + (variable_dict[var_name] as VariableData)._get_value()._run_command(function, params)
	else:
		return "ERR>>noSuchVar>>"+var_name

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
