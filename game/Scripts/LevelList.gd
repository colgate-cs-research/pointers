extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var level_dict : Dictionary
export (Array, Resource) var level_data_list
var cleared_level = -1;

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
	get_node("../LevelDescription").clear()
	get_node("../ActionBar/StartButton").disabled = !is_anything_selected()
	if is_anything_selected():
		get_node("../LevelDescription").append_bbcode(level_dict[get_selected_items()[0]].level_description)
	for id in level_dict.size():
		set_item_disabled(id, id > cleared_level + 1)

func _on_StartButton_pressed():
	SceneHandler._load_scene("res://Scenes/GameLevel.tscn", ["level", level_dict[get_selected_items()[0]], get_selected_items()[0]])
