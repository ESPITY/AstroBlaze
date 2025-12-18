# main_menu.gd
extends Control

@onready var level_selector_screen = preload("res://Scenes/ui_scenes/level_selector.tscn")
@onready var S_button_click: AudioStreamPlayer = $S_button_click


# En el menú principal el nivel actual es 0 y el cursor está visible
func _ready() -> void:
	Config.current_level = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Botón de jugar que lleva al selector de niveles (sonido de click)
func _on_play_button_pressed() -> void:
	S_button_click.play()
	await get_tree().create_timer(0.04).timeout
	get_tree().change_scene_to_packed(level_selector_screen)

# Botón de salir que cierra el juego (sonido de click)
func _on_exit_button_pressed() -> void:
	S_button_click.play()
	await get_tree().create_timer(0.04).timeout
	get_tree().quit()
