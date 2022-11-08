extends Node2D

# Declare member variables here.
# Components order goes clockwise from top left, shapes then circles
var shape_components = [false, false, false, false, false, false, false, false]
var dock

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _setup_shape(component_string, new_dock):
	var split = (component_string as String).split(" ")
	for i in 8:
		if split[i] == "1":
			shape_components[i] = true
		else:
			shape_components[i] = false
	_update_shape_image()
	dock = new_dock;

func _get_dock():
	return dock

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
		return false
	return shape_components[index]

func _compare_shape(comparison):
	for i in 8:
		if shape_components[i] != comparison._has_component(i):
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
