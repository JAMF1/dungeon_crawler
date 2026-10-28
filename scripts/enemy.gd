class_name Enemy
extends CharacterBody2D

@onready var health: HealthComponent = $HealthComponent
@onready var state_machine: Node = $state_machine

@export var data: EnemyData

var player_detected: bool = false
var player_pos: Node2D
var current_player_pos: Vector2

var direction: Vector2

func _ready() -> void:
	health.setup(data.max_health)

func _process(_delta: float) -> void:
	if player_pos:
		current_player_pos = player_pos.global_position

func _physics_process(_delta: float) -> void:
	move_and_slide()

#Entered detection zone
func _on_detection_body_entered(body: Node2D) -> void:
	player_detected = true
	player_pos = body

func _on_detection_body_exited(_body: Node2D) -> void:
	player_detected = false

#Collide with player
func _on_hitbox_body_entered(_body: Node2D) -> void:
	print("Attacking Player!")

func _on_health_component_died() -> void:
	queue_free()
