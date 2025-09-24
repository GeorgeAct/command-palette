extends Control

@onready var active = false

func toggleCommand() -> void:
	visible = active

func _ready() -> void:
	toggleCommand()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("togglecommand"):
		active = !active
		toggleCommand()
