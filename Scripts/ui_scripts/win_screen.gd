extends Control

@onready var lvl_time = $VBoxContainer/MarginContainer/Panel2/HBoxContainer/lvl_time
@onready var new_record = $new_record


# Muestra el cursor
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var current_best_time = Config.LEVEL_TIME_RECORDS[Config.current_level]
	if current_best_time == 0 || Config.level_elapsed_time < current_best_time:
		Config.LEVEL_TIME_RECORDS[Config.current_level] = Config.level_elapsed_time
		new_record.visible = true
	lvl_time.text = str(format_time(Config.level_elapsed_time))
	
# Da formato al tiempo de juego 99:99:99 (minutos, segúndos, centésimas)
func format_time(seconds: float) -> String:
	var mins = int(seconds / 60.0)
	var secs = int(seconds) % 60
	var hunds = int((seconds - int(seconds)) * 100.0)
	
	mins = min(mins, 99)
	secs = min(secs, 99)
	hunds = min(hunds, 99)
	
	return "%02d:%02d:%02d" % [mins, secs, hunds]

# Botón de reseteo de nivel
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

# Botón de regresar al menú principal
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ui_scenes/level_selector.tscn")
