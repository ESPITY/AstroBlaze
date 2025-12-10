extends Control

@onready var game_scene = preload("res://Scenes/game.tscn")
@onready var lvl1_objective = $VBoxContainer/levels/HBoxContainer/level1/MarginContainer/VBoxContainer/HBoxContainer/label1_objective
@onready var lvl1_time = $VBoxContainer/levels/HBoxContainer/level1/MarginContainer/VBoxContainer/HBoxContainer2/label1_time
@onready var lvl2_objective = $VBoxContainer/levels/HBoxContainer/level2/MarginContainer/VBoxContainer/HBoxContainer/label2_objective
@onready var lvl2_time = $VBoxContainer/levels/HBoxContainer/level2/MarginContainer/VBoxContainer/HBoxContainer2/label2_time
@onready var lvl3_objective = $VBoxContainer/levels/HBoxContainer/level3/MarginContainer/VBoxContainer/HBoxContainer/label3_objective
@onready var lvl3_time = $VBoxContainer/levels/HBoxContainer/level3/MarginContainer/VBoxContainer/HBoxContainer2/label3_time

# Muestra el cursor y actualza las labels con el objetivo de cada nivel y el mejor tiempo
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	lvl1_objective.text = str(Config.LEVEL_TARGET_SCORE[1])
	lvl1_time.text = "--:--.-" if Config.LEVEL_TIME_RECORDS[1] == 0 else format_time(Config.LEVEL_TIME_RECORDS[1])
	lvl2_objective.text = str(Config.LEVEL_TARGET_SCORE[2])
	lvl2_time.text = "--:--.-" if Config.LEVEL_TIME_RECORDS[2] == 0 else format_time(Config.LEVEL_TIME_RECORDS[2])
	lvl3_objective.text = str(Config.LEVEL_TARGET_SCORE[3])
	lvl3_time.text = "--:--.-" if Config.LEVEL_TIME_RECORDS[3] == 0 else format_time(Config.LEVEL_TIME_RECORDS[3])
	
# Da formato al tiempo de juego 99:99:99 (minutos, segúndos, centésimas)
func format_time(seconds: float) -> String:
	var mins = int(seconds / 60.0)
	var secs = int(seconds) % 60
	var hunds = int((seconds - int(seconds)) * 100.0)
	
	mins = min(mins, 99)
	secs = min(secs, 99)
	hunds = min(hunds, 99)
	
	return "%02d:%02d:%02d" % [mins, secs, hunds]
	
# Botón nivel 1
func _on_level_1_button_pressed() -> void:
	Config.current_level = 1
	get_tree().change_scene_to_packed(game_scene)

# Botón nivel 2
func _on_level_2_button_pressed() -> void:
	Config.current_level = 2
	get_tree().change_scene_to_packed(game_scene)

# Botón nivel 3
func _on_level_3_button_pressed() -> void:
	Config.current_level = 3
	get_tree().change_scene_to_packed(game_scene)

# Botón volver al menú principal
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ui_scenes/main_menu.tscn")
