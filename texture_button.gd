extends TextureButton

@onready var active = false

var textures = {
	true : "res://Textures/Buttons/Dropdown2.png",
	false: "res://Textures/Buttons/Dropdown1.png"
}

func switch_texture() -> void:
	var texture = load(textures[active])
	set_texture_normal(texture)

func _on_pressed() -> void:
	active = !active
	print(active)
	switch_texture()
	pass # Replace with function body.

func _on_ready() -> void:
	switch_texture()
	pass # Replace with function body.
