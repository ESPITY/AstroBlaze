# explosion_vfx.gd
extends Node2D

# Emitir el VFX de la explosión
func play_vfx():
	$fire_vfx.emitting = true
	$smoke_vfx.emitting = true
