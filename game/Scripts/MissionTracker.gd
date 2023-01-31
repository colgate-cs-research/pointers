extends Node2D

onready var logger = get_node_or_null("../MainUI/CommandLog")
onready var factory = get_node_or_null("../FactoryBase")
var shape = preload("res://Scenes/Shape.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal level_complete

var shape_string = "0 0 0 0 0 0 0 0"
var shape_inputs : Dictionary
var passes_required = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _setup():
	factory._instance_shape_to_game(_generate_shape_string(), factory.get_node_or_null("input_0"))

func _generate_shape_string():
	var string = ""
	for i in 7:
		string += str(randi() % 2) + " "
	string += str(randi() % 2)
	shape_string = string
	return string

func _validate_shape_string(validator):
	var parse_file = XMLParser.new()
	parse_file.open(validator)
	while parse_file.read() != ERR_FILE_EOF:
		if parse_file.get_node_name() == "condition":
			var output = parse_file.get_named_attribute_value("target")
			var output_id = parse_file.get_named_attribute_value_safe("id")
			var output_shape = get_node("../FactoryBase/" + output)._get_shape()
			if output_shape == null:
				return false
			parse_file.read()
			if parse_file.get_node_name() == "shape":
				var target = parse_file.get_named_attribute_value("target")
				var target_shape = get_node("../FactoryBase/" + target)._get_shape()
				if output_shape._compare_shape(target_shape):
					#Read once to skip closing tag
					parse_file.read()
					continue
				else:
					return false
			if parse_file.get_node_name() == "component":
				var target = parse_file.get_named_attribute_value_safe("target")
				var target_shape = null
				if target != "":
					target_shape = get_node("../FactoryBase/" + target)._get_shape()
				parse_file.read()
				var target_value = parse_file.get_node_data()
				match (target_value):
					"true":
						if output_shape._has_component(int(output_id)) != true:
							return false
					"false":
						if output_shape._has_component(int(output_id)) != false:
							return false
					"0", "1", "2", "3", "4", "5", "6", "7":
						if output_shape._has_component(int(output_id)) != target_shape._has_component(int(target_value)):
							return false
					"-0", "-1", "-2", "-3", "-4", "-5", "-6", "-7":
						if output_shape._has_component(abs(int(output_id))) == target_shape._has_component(abs(int(target_value))):
							return false
					var alternate:
						print("No condition: " + alternate)
						return false
				#Read twice to skip closing tags
				parse_file.read()
				parse_file.read()
				continue
		else:
			continue
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_MainUI_run_full_script(origin):
	factory._reset()
	logger.clear()
	get_node("GameTimer").stop()
	factory._instance_shape_to_game(_generate_shape_string(), factory.get_node_or_null("input_0"))
	get_node("GameTimer").start()
	yield(get_node("GameTimer"),"timeout")
	origin._evaluate_all(get_node("GameTimer"))
	var passes = 0
	while passes < passes_required:
		yield(origin, "run_complete")
		if _validate_shape_string(get_node("/root/GameLevel").level_data._get_validator()):
			logger._log_to_label("Shape passed! Generating new shape...")
			factory._reset()
			factory._instance_shape_to_game(_generate_shape_string(), factory.get_node_or_null("input_0"))
			passes += 1
			if passes >= passes_required:
				break
			get_node("GameTimer").wait_time = 0.5/((passes/4)+1)
			get_node("GameTimer").start()
			yield(get_node("GameTimer"),"timeout")
			origin._evaluate_all(get_node("GameTimer"))
		else:
			logger._log_to_label("ERR>>Shape failed to pass!")	
			break
	
	if passes >= passes_required:
		emit_signal("level_complete")
		logger._log_to_label("All tests passed! Great job!")

func _on_MainUI_run_test_script(origin):
	factory._reset()
	logger.clear()
	get_node("GameTimer").stop()
	factory._instance_shape_to_game(_generate_shape_string(), factory.get_node_or_null("input_0"))
	get_node("GameTimer").start()
	yield(get_node("GameTimer"),"timeout")
	origin._evaluate_all(get_node("GameTimer"))
	yield(origin, "run_complete")
	if _validate_shape_string(get_node("/root/GameLevel").level_data._get_validator()):
		logger._log_to_label("Shape passed!")
	else:
		logger._log_to_label("ERR>>Shape failed to pass!")	

func _on_MainUI_return_to_menu():
	SceneHandler._load_scene("res://Scenes/LevelSelect.tscn",["menu", false])

func _on_MainUI_level_ended():
	SceneHandler._load_scene("res://Scenes/LevelSelect.tscn",["menu", true])
