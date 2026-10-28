extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var state_machine: Node = $state_machine
@onready var player_weapon: PlayerWeapon = $player_weapon

@export var data: PlayerData
var attackers: Dictionary = {}
var is_dodging = false

func _ready() -> void:
	health_component.setup(data.max_health)
	player_weapon.update_damage(data.sword_damage)

func _physics_process(delta: float) -> void:
	if state_machine.current_state != $state_machine/dodge and state_machine.current_state != $state_machine/death:
		if Input.is_action_just_pressed("attack"):
			print("Attack")
			print(player_weapon._already_hit)

	for enemy in attackers.keys():
		if not is_instance_valid(enemy):
			print("Invalid")
			attackers.erase(enemy)
			continue
		attackers[enemy] -= delta
		if attackers[enemy] <= 0.0:
			health_component.take_damage(1)
			print("Remaining Health: ", health_component.current_health)
			attackers[enemy] = 2

	move_and_slide()
	
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		attackers[body] = 0.0

func _on_health_component_died() -> void:
	state_machine.change_state("_", "death")
