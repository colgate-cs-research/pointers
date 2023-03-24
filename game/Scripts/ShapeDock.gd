extends Node2D

var input_sprite = preload("res://Sprites/FactorySprites/shape_dock_input.png")
var output_sprite = preload("res://Sprites/FactorySprites/shape_dock_output.png")
var storage_sprite = preload("res://Sprites/FactorySprites/shape_dock_storage.png")
var protected_sprite = preload("res://Sprites/FactorySprites/protected_sprite.png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var shape
var address
var protected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _setup_dock(type, address, protected):
	get_node("DockLabel").position = Vector2(-8,64)
	self.address = address
	get_node_or_null("DockLabel").text = name
	if type == "input":
		get_node_or_null("DockSprite").set_texture(input_sprite)
	elif type == "output":
		get_node_or_null("DockSprite").set_texture(output_sprite)
	elif type == "variable":
		get_node_or_null("DockSprite").set_texture(storage_sprite)
	else:
		print("Wrong Type")
		get_node_or_null("DockSprite").set_texture(storage_sprite)
	self.protected = protected
	if protected:
		get_node("ProtectedSprite").set_texture(protected_sprite)
	else:
		get_node("ProtectedSprite").set_texture(null)

func _set_shape(new_shape):
	shape = new_shape

func _get_shape():
	return shape

func _get_address():
	return address

func _is_protected():
	return protected

func _variable_type():
	return "variable"

func _reset():
	if shape != null:
		shape.queue_free()
	shape = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
