class_name HealthComponent
extends Node2D

signal health_changed(current:int, maximum:int)
signal died

var max_health: int
var current_health: int
var is_dead: bool = false

func setup(max_hp: int) -> void:
	max_health = max_hp
	current_health = max_hp
	is_dead = false
	
func take_damage(amount: int) -> void:
	if is_dead or amount <= 0:
		return
	current_health = max(current_health - amount, 0)
	health_changed.emit(current_health, max_health)
	
	if current_health == 0:
		is_dead = true 
		died.emit()

func increase_max_health(amount: int) -> void:
	if is_dead or amount <= 0:
		return
	max_health += amount
	current_health += amount
	health_changed.emit(current_health, max_health)
