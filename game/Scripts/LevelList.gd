extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var level_dict : Dictionary
export (Array, Resource) var level_data_list
var unlocked_level = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	for level in level_data_list:
		_add_level(level)

func _add_level(level : LevelData):
	var id = level_dict.size()
	level_dict[id] = level
	add_item("Level " + str(id) + ": " + level.level_title)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("../ActionBar/StartButton").disabled = !is_anything_selected()

func _on_StartButton_pressed():
	SceneHandler._load_scene("res://Scenes/GameLevel.tscn", ["level", level_dict[get_selected_items()[0]]])
