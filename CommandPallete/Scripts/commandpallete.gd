extends Control

@onready var active
@onready var buttonActive
@onready var config = ConfigFile.new()
@onready var err = config.load("res://project.godot")
var input_values = {}

var textures = {
	true : "./CommandPallete/Textures/Buttons/Dropdown2.png",
	false: "./CommandPallete/Textures/Buttons/Dropdown1.png"
}

var toggles = {
	true : enableCommand,
	false: disableCommand
}

func switch_texture() -> void:
	var texture = load(textures[buttonActive])
	$Panel/TextureButton.set_texture_normal(texture)

func enableCommand() -> void:
	visible = active
	$Panel/LineEdit.grab_focus()
	$Panel/LineEdit.clear()
	$Panel/LineEdit.editable = true
	$Panel/LineEdit.grab_focus()

func disableCommand() -> void:
	$Panel/LineEdit.release_focus()
	visible = active
	$Panel/LineEdit.editable = false
	$Panel/LineEdit.clear()

func _ready() -> void:
	toggles[active].call()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("togglecommand"):
		active = !active
		toggles[active].call()

func _on_texture_button_pressed() -> void:
	buttonActive = !buttonActive
	print(buttonActive)
	switch_texture()

func _on_texture_button_ready() -> void:
	active = false
	buttonActive = false
	switch_texture()

#if err == OK:
		#print("\n1")
		#for input in config.get_section_keys("input"):
			#if input != "togglecommand":
				#print(input)
				#input_values[input] = config.get_value("input", input)
				#config.set_value("input", input, null)
				#print(input_values[input])
		#print("\n2")
		#for input in config.get_section_keys("input"):
			#print(input)
			#var value = config.get_value("input", input)
			#print(value)
		#print("\n3")
		#for input in input_values:
			#config.set_value("input", input, input_values[input])
		#print("\n4")
		#for input in config.get_section_keys("input"):
			#print(input)
			#var value = config.get_value("input", input)
			#print(value)
