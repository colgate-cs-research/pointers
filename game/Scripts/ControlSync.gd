extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var documentation = "res://Files/help.xml"

signal run_full_script(origin)
signal run_test_script(origin)

signal return_to_menu()

signal level_ended()

signal export_code(code_text, test_mode)

var level_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ScriptBox_run_full_script(origin):
	emit_signal("run_full_script", origin)

func _on_ScriptBox_run_test_script(origin):
	emit_signal("run_test_script", origin)

func _on_MenuButton_pressed():
	emit_signal("return_to_menu")

func _on_HelpButton_pressed():
	get_node("DialogLayer/HelpDialog").popup_centered()
	var helpText = get_node("DialogLayer/HelpDialog/HelpDialogText")
	_add_documentation(helpText)

func _on_ConditionsButton_pressed():
	get_node("DialogLayer/ConditionsDialog").popup_centered()
	var conditionsText = get_node("DialogLayer/ConditionsDialog/ConditionsDialogText")
	conditionsText.clear()
	conditionsText.append_text(level_data.level_objective)

func _on_CodeButton_pressed():
	get_node("DialogLayer/ScriptDialog").popup_centered()

func _on_MissionTracker_level_complete():
	get_node("DialogLayer/CompletionDialog").popup_centered()
	var completionText = get_node("DialogLayer/CompletionDialog/CompletionDialogText")
	completionText.clear()
	completionText.append_text("Level Complete!")

func _on_level_end():
	emit_signal("level_ended")

func _add_documentation(helpText : RichTextLabel):
	helpText.clear()
	var currentLevel = 0  #keeps track of the level number
	var currentId = false
	var counter= 0; #number of times while loop has been traversed
	var terminate = false
	var parse_file = XMLParser.new()
	parse_file.open(documentation)
	#Skip the xml header and first body tag
	parse_file.read()
	parse_file.read()
	while parse_file.read() != ERR_FILE_EOF && !terminate:
		counter+=1
		if parse_file.get_node_type() == parse_file.NODE_ELEMENT_END:
			continue
		match parse_file.get_node_name():
			"section":
				currentLevel = int(parse_file.get_named_attribute_value("level"))+1
				if level_data.level_id == currentLevel:
					currentId = true
				elif currentLevel < counter:
					currentId = false
			"header":
				#Move to text node
				parse_file.read()
				if currentId == true:
					helpText.append_text( parse_file.get_node_data() + "\n")
				else:
					helpText.append_text( "")	
				#Skip closing tags
				parse_file.read()
			"text":
				#Move to text node
				parse_file.read()
				if currentId == true:
					helpText.append_text( parse_file.get_node_data() + "\n")
				else:
					helpText.append_text( "")	
				#Skip closing tags
				parse_file.read()
			"code":
				#Move to text node
				parse_file.read()
				if currentId == true:
					helpText.append_text( parse_file.get_node_data() + "\n")
				else:
					helpText.append_text( "")	
				#Skip closing tags
				parse_file.read()
			"break":
				if currentId == true:
					helpText.append_text("\n")
			#"section":
				#if currentId < int(parse_file.get_named_attribute_value("level")):
					#terminate = true
			"documentation":
				helpText.append_text("ERROR\n")
				#Skip closing tags
				parse_file.read()

func _on_export_code(code_text, test_mode):
	emit_signal("export_code", code_text, test_mode)

func _on_external_logger(message):
	get_node("DialogLayer/LogDialog/CommandLog")._log_to_label(message)

func _on_clear_logger():
	get_node("DialogLayer/LogDialog/CommandLog").clear()
