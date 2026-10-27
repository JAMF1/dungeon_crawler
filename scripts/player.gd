extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $state_machine
@onready var player_weapon: PlayerWeapon = $player_weapon


var attackers: Dictionary = {}
var speed: float = 100.0
var is_dodging = false

func _ready() -> void:
	health_component.setup(2)
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "dodge":
		is_dodging = false
		
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
	$state_machine.change_state($state_machine/death)
