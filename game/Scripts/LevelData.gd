extends Resource
class_name LevelData

#To be displayed to user
export(int) var level_number
export(String) var level_tag
export(String) var level_title
export(String, MULTILINE) var level_description
export(String, MULTILINE) var level_objective
#To be used to construct the factory
export(int) var inputs
export(int) var outputs
export(int) var variables
export(int) var pointers
#To validate the level
export(String) var validator_name

func _get_validator():
	return "res://Levels/Validators/" + validator_name + ".xml"
