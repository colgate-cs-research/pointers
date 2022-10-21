extends Node2D


# Declare member variables here. Examples:
var power = 1;
var health = 1;

var valid_commands = ["weaken", "strengthen", "damage", "heal"]

func _setup(powerP, healthP):
	power = powerP
	health = healthP

func _weaken(effect):
	power -= effect;
	if power < 0:
		power = 0

func _strengthen(effect):
	power += effect;

func _damage(effect):
	health -= effect;
	if health < 0:
		health = 0

func _heal(effect):
	health += effect;

func _as_str():
	return name + "," + str(power) + "," + str(health)

func _is_valid_command(command):
	return valid_commands.has(command)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
