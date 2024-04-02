class_name Main_Menu
extends Control
@onready var Start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_button as Button;
@onready var Exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_button as Button;
@onready var start_level = preload("res://Scenes/LevelSelect.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	Start_button.button_down.connect(on_start_pressed)
	Exit_button.button_down.connect(on_exit_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	#pass
	
func on_exit_pressed() -> void:
	get_tree().quit()



# Called every frame. 'delta' is the elapsed time since the previous frame.


