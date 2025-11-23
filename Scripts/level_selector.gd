extends Control


func _on_level_1_button_pressed() -> void:
	Globals.current_level = 1
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_level_2_button_pressed() -> void:
	Globals.current_level = 2
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_level_3_button_pressed() -> void:
	Globals.current_level = 3
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
