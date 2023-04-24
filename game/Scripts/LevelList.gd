extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var level_list = "res://Files/level_list.xml"
var level_dict : Dictionary
var level_data_list : Array
var cleared_level = -1;
@export var cleared_level_override = -2;

# Called when the node enters the scene tree for the first time.
func _ready():
	if cleared_level_override > -2:
		cleared_level = cleared_level_override
	_parse_level_list()
	for level in level_data_list:
		_add_level(level)

func _add_level(level : LevelData):
	var id = level_dict.size()
	level_dict[id] = level
	var prefix = level.level_prefix
	if prefix != null and prefix != "":
		prefix += " "
	add_item(prefix + "Level " + str(level.level_number) + level.level_tag + ": " + level.level_title)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("../LevelDescription").clear()
	get_node("../ActionBar/StartButton").disabled = !is_anything_selected()
	if is_anything_selected():
		get_node("../LevelDescription").append_text(level_dict[get_selected_items()[0]].level_description)
	for id in level_dict.size():
		set_item_disabled(id, id > cleared_level + 1)

func _on_StartButton_pressed():
	SceneHandler._load_scene("res://Scenes/GameLevel.tscn", ["level", level_dict[get_selected_items()[0]], get_selected_items()[0]])

func _parse_level_list():
	var parse_file = XMLParser.new()
	parse_file.open(level_list)
	#Skip the xml header and first body tag
	parse_file.read()
	parse_file.read()
	while parse_file.read() != ERR_FILE_EOF:
		if parse_file.get_node_type() == parse_file.NODE_ELEMENT_END:
			continue
		if parse_file.get_node_name() == "level":
			#Move to text node
			parse_file.read()
			level_data_list.append(load("res://Levels/" + parse_file.get_node_data()+".tres"))
			#Skip closing tags
			parse_file.read()
