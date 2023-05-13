extends Node

# Declare member variables here. Examples:
var current_scene = null

#TO REPLACE WITH SCENE PACKING
var current_level_id = -1;

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func _load_scene(path, params):
	call_deferred("_load_scene_deferred", path, params)

func _load_scene_deferred(path, params):
	current_scene.free()
	
	var new_scene = ResourceLoader.load(path)
	current_scene = new_scene.instantiate()
	
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	
	if params[0] == "level":
		current_scene.level_data = params[1]
		current_scene.get_node("MissionTracker")._setup()
		current_scene.get_node("MainUI").level_data = current_scene.level_data
		current_scene.get_node("MainUI/DialogLayer/ScriptDialog/ScriptBox")._setup_autocode(current_scene.level_data)
		current_scene.get_node("MainUI/DialogLayer/CompletionDialog").hide()
		current_scene.get_node("MainUI/DialogLayer/ConditionsDialog").hide()
		current_scene.get_node("MainUI/DialogLayer/HelpDialog").hide()
		current_scene.get_node("MainUI/DialogLayer/ScriptDialog").hide()
		current_level_id = params[2]
	elif params[0] == "menu":
		if params[1]:
			current_scene.get_node("LevelList").cleared_level = max(current_level_id, current_scene.get_node("LevelList").cleared_level)
	else:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
