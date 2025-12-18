# healthbar.gd
extends ProgressBar


# Setter del valor máximo
func set_healthbar(max_health):
	max_value = max_health
	value = max_health

# Setter del valor
func _on_update_healthbar(health):
	value = health
