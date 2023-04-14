extends Resource
class_name LevelData

#To be displayed to user
@export var level_number: int
@export var level_tag: String
@export var level_title: String
@export_multiline var level_description: String
@export_multiline var level_objective: String
@export_multiline var pre_code: String
@export_multiline var post_code: String

#To be used to construct the factory
@export var inputs: int
@export var outputs: int
@export var variables: int
@export var pointers: int
#To validate the level
@export var xml_name: String

func _get_validator():
	return "res://Levels/Validators/" + xml_name + ".xml"

func _get_generator():
	return "res://Levels/Generators/" + xml_name + ".xml"
