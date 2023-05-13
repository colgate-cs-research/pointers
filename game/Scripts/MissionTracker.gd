extends Node2D

@onready var logger = get_node_or_null("../MainUI/DialogLayer/LogDialog/CommandLog")
@onready var factory = get_node_or_null("../FactoryBase")
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
	factory._setup()

func _generate_random_shape_string():
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
			var output_dock = get_node_or_null("../FactoryBase/" + output)
			if output_dock == null:
				return false
			var output_shape = get_node("../FactoryBase/" + output)._get_shape()
			parse_file.read()
			if parse_file.get_node_name() == "null":
				if output_shape == null:
					#Read once to skip closing tag
					parse_file.read()
					continue
				else:
					return false
			elif output_shape == null:
				return false
			if parse_file.get_node_name() == "shape":
				var target = parse_file.get_named_attribute_value("target")
				var target_shape = get_node("../FactoryBase/" + target)._get_shape()
				if output_shape._compare_shape(target_shape):
					#Read once to skip closing tag
					parse_file.read()
					continue
				else:
					return false
			if parse_file.get_node_name() == "shapestring":
				if output_shape._compare_shape_string(parse_file.get_named_attribute_value("value")):
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
		elif parse_file.get_node_name() == "condition":
			parse_file.read()
		elif parse_file.get_node_name() == "context":
			var target = parse_file.get_named_attribute_value_safe("target")
			var target_node = get_node("../FactoryBase/" + target)
			var protection = parse_file.get_named_attribute_value_safe("protected")
			if protection == "true":
				if not target_node._is_protected():
					logger._log_to_label("ERR>>Shape " + target + " should be protected but is not!")	
					return false
			parse_file.read()
		else:
			continue
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_MainUI_run_full_script(origin):
	logger.clear()
	factory._instance_shape_to_game(_generate_random_shape_string(), factory.get_node("input_0"))
	for i in 256:
		var shape_string = str(floor(i/128)) + " "
		shape_string = shape_string + str(floor(i%128/64)) + " "
		shape_string = shape_string + str(floor(i%64/32)) + " "
		shape_string = shape_string + str(floor(i%32/16)) + " "
		shape_string = shape_string + str(floor(i%16/8)) + " "
		shape_string = shape_string + str(floor(i%8/4)) + " "
		shape_string = shape_string + str(floor(i%4/2)) + " "
		shape_string = shape_string + str(floor(i%2)) + " "
		origin.call_deferred("_evaluate_all_fast")
		await origin.run_complete
		if _validate_shape_string(get_node("/root/GameLevel").level_data._get_validator()):
			logger._log_to_label("Shape passed! Generating new shape...")
			factory._reset()
			factory._instance_shape_to_game(shape_string, factory.get_node("input_0"))
			origin._evaluate_all_fast()
		else:
			logger._log_to_label("ERR>>Shape " + shape_string + " failed to pass!")	
			break
	emit_signal("level_complete")
	logger._log_to_label("All tests passed! Level complete!")

func _on_MainUI_run_test_script(origin):
	logger.clear()
	if _validate_shape_string(get_node("/root/GameLevel").level_data._get_validator()):
		logger._log_to_label("Shape passed!")
	else:
		logger._log_to_label("ERR>>Shape failed to pass!")	

func _level_completed():
	emit_signal("level_complete")

func _validate_factory_state():
	logger.clear()
	if _validate_shape_string(get_node("/root/GameLevel").level_data._get_validator()):
		return true
	else:
		return false

func _generate_input_value_params():
	var restrictions = [-1, -1, -1, -1, -1, -1, -1, -1]
	var fragment_list = []
	var mode = "string"
	var parse_file = XMLParser.new()
	parse_file.open(get_node("/root/GameLevel").level_data._get_generator())
	while parse_file.read() != ERR_FILE_EOF:
		while parse_file.get_node_type() == XMLParser.NODE_ELEMENT_END && !parse_file.is_empty():
			if parse_file.read() == ERR_FILE_EOF:
				return
		if parse_file.get_node_name() == "generator":
			match parse_file.get_named_attribute_value_safe("type"):
				"string":
					while parse_file.get_node_name() == "restrict":
						restrictions[int(parse_file.get_named_attribute_value_safe("slot"))] = int(parse_file.get_named_attribute_value_safe("state"))
				"fragment":
					while parse_file.get_node_name() == "permit":
						fragment_list.append(parse_file.get_named_attribute_value_safe("value"))
	match mode:
		"string":
			return [restrictions, "string"]
		"fragment":
			return [fragment_list, "fragment"]

func _on_MainUI_return_to_menu():
	SceneHandler._load_scene("res://Scenes/LevelSelect.tscn",["menu", false])

func _on_MainUI_level_ended():
	SceneHandler._load_scene("res://Scenes/LevelSelect.tscn",["menu", true])
