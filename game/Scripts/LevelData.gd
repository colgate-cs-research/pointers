extends Resource
class_name LevelData

#To be displayed to user
@export var level_number: int
@export var level_id:int
@export var level_tag: String
@export var level_prefix: String
@export var level_title: String
@export_multiline var level_description: String
@export_multiline var level_objective: String
@export_multiline var pre_code: String
@export_multiline var post_code: String

#To validate the level
@export var xml_name: String

func _get_validator():
	return "res://Levels/Validators/" + xml_name + ".xml"

func _get_generator():
	return "res://Levels/Generators/" + xml_name + ".xml"
