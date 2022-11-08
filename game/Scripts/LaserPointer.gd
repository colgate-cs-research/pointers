extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _setup_pointer():
	get_node("PointerSprite").rotation = 0
	get_node("PointerLabel").text = name

func _point_at(target_dock):
	if target_dock == null:
		return;
	target = target_dock
	var adjust_position = target_dock.position - position
	get_node("PointerBeam").clear_points()
	get_node("PointerBeam").add_point(Vector2(0,0))
	get_node("PointerBeam").add_point(adjust_position)
	var radians = atan2(adjust_position.y, adjust_position.x) + PI/2
	get_node("PointerSprite").rotation = radians

func _get_target():
	return target

func _reset():
	target = null
	get_node("PointerSprite").rotation = 0
	get_node("PointerBeam").clear_points()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
