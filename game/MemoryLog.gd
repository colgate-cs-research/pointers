extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bbcode_text = ""
	for address in MainMemory.address_dict:
		if MainMemory._get_type_from_address(address) == "robot" && MainMemory._get_value_from_address(address) != null:
			append_bbcode(str(address) + ": " + str(MainMemory._get_type_from_address(address)) + " " + str(MainMemory.address_dict[address]) + " = " + MainMemory._get_value_from_address(address)._as_str() + "\n")			
		else:
			append_bbcode(str(address) + ": " + str(MainMemory._get_type_from_address(address)) + " " + str(MainMemory.address_dict[address]) + " = " + str(MainMemory._get_value_from_address(address)) + "\n")
