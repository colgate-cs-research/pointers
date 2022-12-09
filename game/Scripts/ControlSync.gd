extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal pointer_at_address(pointer, target)
signal pointer_at_pointer(pointer, target)
signal composition_from_variable(variable, target)
signal composition_from_pointer(variable, target)
signal composition_from_shape(variable, shape)
signal cut_from_variable(variable, target)
signal cut_from_pointer(variable, pointer)
signal cut_from_shape(variable, shape)
signal has_at_pointer(pointer, index)
signal has_at_variable(variable, index)
signal set_variable_to_shape(destination, shape)
signal set_variable_to_variable(destination, variable)
signal set_variable_to_pointer(destination, pointer)
signal set_pointer_to_shape(destination, shape)
signal set_pointer_to_variable(destination, variable)
signal set_pointer_to_pointer(destination, pointer)

signal run_full_script(origin)
signal run_test_script(origin)

signal return_to_menu()

signal level_ended()

var level_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ScriptBox_pointer_at_pointer(pointer, target):
	emit_signal("pointer_at_pointer", pointer, target)

func _on_ScriptBox_pointer_at_address(pointer, target):
	emit_signal("pointer_at_address", pointer, target)

func _on_ScriptBox_composition_from_shape(variable, shape):
	emit_signal("composition_from_shape", variable, shape)

func _on_ScriptBox_composition_from_pointer(variable, pointer):
	emit_signal("composition_from_pointer", variable, pointer)

func _on_ScriptBox_composition_from_variable(variable, target):
	emit_signal("composition_from_variable", variable, target)

func _on_ScriptBox_cut_from_pointer(variable, pointer):
	emit_signal("cut_from_pointer", variable, pointer)

func _on_ScriptBox_cut_from_shape(variable, shape):
	emit_signal("cut_from_shape", variable, shape)

func _on_ScriptBox_cut_from_variable(variable, target):
	emit_signal("cut_from_variable", variable, target)

func _on_ScriptBox_has_at_pointer(pointer, index):
	emit_signal("has_at_pointer", pointer, index)

func _on_ScriptBox_has_at_variable(variable, index):
	emit_signal("has_at_pointer", variable, index)

func _on_ScriptBox_set_pointer_to_pointer(destination, pointer):
	emit_signal("set_pointer_to_pointer", destination, pointer)

func _on_ScriptBox_set_pointer_to_shape(destination, shape):
	emit_signal("set_pointer_to_shape", destination, shape)

func _on_ScriptBox_set_pointer_to_variable(destination, variable):
	emit_signal("set_pointer_to_variable", destination, variable)

func _on_ScriptBox_set_variable_to_pointer(destination, pointer):
	emit_signal("set_variable_to_pointer", destination, pointer)

func _on_ScriptBox_set_variable_to_shape(destination, shape):
	emit_signal("set_variable_to_shape", destination, shape)

func _on_ScriptBox_set_variable_to_variable(destination, variable):
	emit_signal("set_variable_to_variable", destination, variable)

func _on_ScriptBox_run_full_script(origin):
	emit_signal("run_full_script", origin)

func _on_ScriptBox_run_test_script(origin):
	emit_signal("run_test_script", origin)

func _on_MenuButton_pressed():
	emit_signal("return_to_menu")

func _on_HelpButton_pressed():
	emit_signal("pause_factory")
	get_node("DialogLayer/HelpDialog").popup_centered()
	var helpText = get_node("DialogLayer/HelpDialog/HelpDialogText")
	helpText.clear()
	helpText.append_bbcode("DOCUMENTATION TO BE IMPLEMENTED")

func _on_ConditionsButton_pressed():
	emit_signal("pause_factory")
	get_node("DialogLayer/ConditionsDialog").popup_centered()
	var conditionsText = get_node("DialogLayer/ConditionsDialog/ConditionsDialogText")
	conditionsText.clear()
	conditionsText.append_bbcode(level_data.level_objective)

func _on_MissionTracker_level_complete():
	get_node("DialogLayer/CompletionDialog").popup_centered()
	var completionText = get_node("DialogLayer/CompletionDialog/CompletionDialogText")
	completionText.clear()
	completionText.append_bbcode("Level Complete!")

func _on_CompletionDialog_popup_hide():
	emit_signal("level_ended")
