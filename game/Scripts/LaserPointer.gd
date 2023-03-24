extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var beam_divs = 4
var beam_base_rotation = 0.125

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _setup_pointer():
	get_node_or_null("PointerSprite").rotation = 0
	get_node_or_null("PointerLabel").text = name

func _point_at(target_dock):
	if target_dock == null:
		return;
	target = target_dock
	var adjust_position = target_dock.position - position
	var beam = get_node_or_null("PointerBeam")
	get_node_or_null("DereferenceBeam").clear_points()
	_draw_beam_arc(beam, Vector2(32, 32), adjust_position + Vector2(32, 32))
	var radians = atan2(adjust_position.y, adjust_position.x) + PI/2
	get_node_or_null("PointerSprite").rotation = radians

func _dereference(target_dock):
	if target_dock == null:
		return;
	var adjust_position = target_dock.position - position
	var beam = get_node_or_null("DereferenceBeam")
	_draw_beam_arc(beam, Vector2(32, 32), adjust_position + Vector2(32, 32))

func _get_target():
	return target

func _variable_type():
	return "pointer"

func _reset():
	target = null
	get_node_or_null("PointerSprite").rotation = 0
	get_node_or_null("PointerBeam").clear_points()
	get_node_or_null("DereferenceBeam").clear_points()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw_beam_arc(beam : Line2D, coords_0 : Vector2, coords_1 : Vector2):
	beam.clear_points()
	beam.add_point(coords_0)
	for i in _get_displaced_point(coords_0, coords_1, 0):
		beam.add_point(i)
	beam.add_point(coords_1)

func _get_displaced_point(coords_0 : Vector2, coords_1 : Vector2, iter : int):
	var return_array = []
	var coords_center = (coords_0 + coords_1)/2.0
	var center_vector = coords_center - coords_0
	var vector_adjust = center_vector.rotated(PI/2 * beam_base_rotation / (iter + 1)).normalized() * center_vector.length()
	var coords_center_new = coords_0 + vector_adjust
	if iter < beam_divs:
		return_array.append_array(_get_displaced_point(coords_0, coords_center_new, iter + 1))
	return_array.append(coords_center_new)
	if iter < beam_divs:
		return_array.append_array(_get_displaced_point(coords_center_new, coords_1, iter + 1))
	return return_array
	
