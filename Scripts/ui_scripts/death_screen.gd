# death_screen.gd
extends Control

@onready var S_button_click: AudioStreamPlayer = $S_button_click
@onready var S_game_over: AudioStreamPlayer = $S_game_over


# Muestra el cursor y activa el sonido de derrota
func _ready() -> void:
	S_game_over.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Botón de reseteo de nivel (sonido de click)
func _on_restart_button_pressed() -> void:
	S_button_click.play()
	await get_tree().create_timer(0.04).timeout
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

# Botón de regresar al menú principal (sonido de click)
func _on_levels_button_pressed() -> void:
	S_button_click.play()
	await get_tree().create_timer(0.04).timeout
	get_tree().change_scene_to_file("res://Scenes/ui_scenes/level_selector.tscn")
