extends TextureButton

@onready var active = false
@onready var config = ConfigFile.new()
@onready var err = config.load("res://project.godot")

var textures = {
	true : "./CommandPallete/Textures/Buttons/Dropdown2.png",
	false: "./CommandPallete/Textures/Buttons/Dropdown1.png"
}


var input_values = {}

func switch_texture() -> void:
	var texture = load(textures[active])
	set_texture_normal(texture)

func _on_pressed() -> void:
	active = !active
	print(active)
	switch_texture()
	pass # Replace with function body.

func _on_ready() -> void:
	if err == OK:
		print("\n1")
		for input in config.get_section_keys("input"):
			if input != "togglecommand":
				print(input)
				input_values[input] = config.get_value("input", input)
				config.set_value("input", input, null)
				print(input_values[input])
		print("\n2")
		for input in config.get_section_keys("input"):
			print(input)
			var value = config.get_value("input", input)
			print(value)
		print("\n3")
		for input in input_values:
			config.set_value("input", input, input_values[input])
		print("\n4")
		for input in config.get_section_keys("input"):
			print(input)
			var value = config.get_value("input", input)
			print(value)
	switch_texture()
	pass # Replace with function body.
