extends Node

# Declare member variables here. Examples:
var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func _load_scene(path, params):
	call_deferred("_load_scene_deferred", path, params)

func _load_scene_deferred(path, params):
	current_scene.free()
	
	var new_scene = ResourceLoader.load(path)
	current_scene = new_scene.instance()
	
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	
	if params[0] == "level":
		current_scene.level_data = params[1]
		current_scene.get_node("FactoryBase")._setup()
		current_scene.get_node("MissionTracker")._setup()
	elif params[0] == "menu":
		pass
	else:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
