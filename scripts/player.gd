extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var state_machine: Node = $state_machine
@onready var player_weapon: PlayerWeapon = $player_weapon

@export var data: PlayerData
var attackers: Dictionary = {}
var is_dodging = false
var is_dead = false

func _ready() -> void:
	health_component.setup(data.max_health)
	player_weapon.knockback_duration = data.knockback_duration
	player_weapon.knockback_force = data.knockback_force
	player_weapon.update_damage(data.sword_damage)

func _physics_process(delta: float) -> void:
	for enemy in attackers.keys():
		if not is_instance_valid(enemy):
			print("Invalid")
			attackers.erase(enemy)
			continue
		attackers[enemy] -= delta
		if attackers[enemy] <= 0:
			health_component.take_damage(enemy.damage)
			print("Remaining Health: ", health_component.current_health)
			attackers[enemy] = enemy.attack_interval

	move_and_slide()
	
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		attackers[body] = 0.0

func _on_hitbox_body_exited(body: Node2D) -> void:
	attackers.erase(body)
	
func _on_health_component_died() -> void:
	is_dead = true
	state_machine.change_state("_", "death")
