extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var level_dict : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	#Test Code
	add_item("Level 1")
	add_item("Level 2")
	add_item("Level 3")

func _add_level(level : LevelData):
	var id = level_dict.size()
	level_dict[id] = level
	add_item("Level " + id + ": " + level.level_title)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
