extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var documentation = "res://Files/help.xml"

signal run_full_script(origin)
signal run_test_script(origin)

signal return_to_menu()

signal level_ended()

signal export_code(code_text)

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

func _on_CompletionDialog_popup_hide():
	emit_signal("level_ended")

func _add_documentation(helpText : RichTextLabel):
	helpText.clear()
	var terminate = false
	var parse_file = XMLParser.new()
	parse_file.open(documentation)
	#Skip the xml header and first body tag
	parse_file.read()
	parse_file.read()
	while parse_file.read() != ERR_FILE_EOF && !terminate:
		if parse_file.get_node_type() == parse_file.NODE_ELEMENT_END:
			continue
		match parse_file.get_node_name():
			"header":
				#Move to text node
				parse_file.read()
				helpText.append_text("[b]" + parse_file.get_node_data() + "[/b]\n")
				#Skip closing tags
				parse_file.read()
			"text":
				#Move to text node
				parse_file.read()
				helpText.append_text(parse_file.get_node_data() + "\n")
				#Skip closing tags
				parse_file.read()
			"code":
				#Move to text node
				parse_file.read()
				helpText.append_text("[code]" + parse_file.get_node_data() + "[/code]\n")
				#Skip closing tags
				parse_file.read()
			"break":
				helpText.append_text("\n")
			"section":
				if level_data.level_number < int(parse_file.get_named_attribute_value("level")):
					terminate = true
			"documentation":
				break
			_:
				helpText.append_text("ERROR\n")
				#Skip closing tags
				parse_file.read()

func _on_export_code(code_text):
	emit_signal("export_code", code_text)

func _on_external_logger(message):
	get_node("CommandLog")._log_to_label(message)
