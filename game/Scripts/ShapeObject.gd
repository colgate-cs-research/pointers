extends Node2D

# Declare member variables here.
# Components order goes clockwise from top right, squares then circles
var shape_components = [false, false, false, false, false, false, false, false]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _setup_shape_string(component_string):
	var split = (component_string as String).split(" ")
	for i in 8:
		if split[i] == "1":
			shape_components[i] = true
		else:
			shape_components[i] = false
	_update_shape_image()

func _setup_shape_fragment(fragment_string):
	match fragment_string:
		"ALL":
			shape_components = [true, true, true, true, true, true, true, true]
		"NON":
			shape_components = [false, false, false, false, false, false, false, false]
		"CIR":
			shape_components = [false, false, false, false, true, true, true, true]
		"SQR":
			shape_components = [true, true, true, true, false, false, false, false]
		"TLS":
			shape_components = [false, false, false, true, false, false, false, false]
		"TRS":
			shape_components = [true, false, false, false, false, false, false, false]
		"BRS":
			shape_components = [false, true, false, false, false, false, false, false]
		"BLS":
			shape_components = [false, false, true, false, false, false, false, false]
		"TLC":
			shape_components = [false, false, false, false, false, false, false, true]
		"TRC":
			shape_components = [false, false, false, false, true, false, false, false]
		"BRC":
			shape_components = [false, false, false, false, false, true, false, false]
		"BLC":
			shape_components = [false, false, false, false, false, false, true, false]
		_:
			shape_components = [false, false, false, false, false, false, false, false]
	_update_shape_image()

# Change this shape to include a component if either this or the composition has a component at any given position
func _compose_shape(composition):
	for i in 8:
		shape_components[i] = shape_components[i] || composition._has_component(i)
	_update_shape_image()
	return self

# Remove any sections in this shape that are also present in the cut shape
func _cut_shape(cut):
	for i in 8:
		if shape_components[i] == true && cut._has_component(i):
			shape_components[i] = false
	_update_shape_image()
	return self

func _has_component(index):
	if index > shape_components.size():
		return null
	return shape_components[index]

func _compare_shape(comparison):
	for i in 8:
		if shape_components[i] != comparison._has_component(i):
			return false
	return true

func _compare_shape_string(comparison):
	var split = (comparison as String).split(" ")
	var compare_string = []
	for i in 8:
		if split[i] == "1":
			compare_string.append(true)
		else:
			compare_string.append(false)
	for i in 8:
		if shape_components[i] != compare_string[i]:
			return false
	return true

func _get_shape_data_encoding():
	var ret_val = ""
	for i in shape_components:
		if i:
			ret_val += "1 "
		else:
			ret_val += "0 "
	return ret_val.strip_edges()

func _get_shape_data_str():
	var ret_val = ""
	for i in shape_components:
		ret_val += str(i) + " "
	return ret_val.strip_edges()

func _update_shape_image():
	get_node_or_null("TRSquare").visible = shape_components[0]
	get_node_or_null("BRSquare").visible = shape_components[1]
	get_node_or_null("BLSquare").visible = shape_components[2]
	get_node_or_null("TLSquare").visible = shape_components[3]
	get_node_or_null("TRCircle").visible = shape_components[4]
	get_node_or_null("BRCircle").visible = shape_components[5]
	get_node_or_null("BLCircle").visible = shape_components[6]
	get_node_or_null("TLCircle").visible = shape_components[7]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
