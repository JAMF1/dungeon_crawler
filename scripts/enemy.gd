class_name Enemy
extends CharacterBody2D

@onready var health: HealthComponent = $HealthComponent
@export var data: EnemyData

var player_detected: bool = false
var player_body: Node2D
var current_player_pos: Vector2

var direction: Vector2
var damage: int
var attack_interval: float

var knockback: Vector2 = Vector2.ZERO
var knockback_timer: float = 0.0

func _ready() -> void:
	health.setup(data.max_health)
	damage = data.attack_damage
	attack_interval = data.attack_interval

func _process(_delta: float) -> void:
	if player_body:
		if player_body.is_dead:
			player_detected = false
		else:
			current_player_pos = player_body.global_position

func _physics_process(delta: float) -> void:
	if knockback_timer > 0.0:
		velocity = knockback
		knockback_timer -= delta
		if knockback_timer <= 0.0:
			knockback = Vector2.ZERO
	
	move_and_slide()

#Entered detection zone
func _on_detection_body_entered(body: Node2D) -> void:
	player_detected = true
	player_body = body

func _on_detection_body_exited(_body: Node2D) -> void:
	player_detected = false

func _on_hitbox_body_entered(_body: Node2D) -> void:
	pass

func _on_health_component_died() -> void:
	queue_free()
	
func apply_knockback(knockback_direction: Vector2, force: float, knockback_duration: float) -> void:
	knockback = knockback_direction * force
	knockback_timer = knockback_duration
