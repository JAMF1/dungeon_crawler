class_name Enemy
extends CharacterBody2D

@onready var detection: Area2D = $Detection
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $state_machine
@onready var health_component: HealthComponent = $HealthComponent

@export var enemy_data : EnemyData
var player_pos: Node2D
var current_player_pos: Vector2
var enemy_roam_speed: float = 10.0
var enemy_direction: Vector2

func _ready() -> void:
	health_component.setup(2)
	

func _process(_delta: float) -> void:
	if player_pos:
		current_player_pos = player_pos.global_position
		

func _physics_process(_delta: float) -> void:
	move_and_slide()

#Entered detection zone
func _on_detection_body_entered(body: Node2D) -> void:
	player_pos = body
	state_machine.change_state($state_machine/follow)


func _on_detection_body_exited(_body: Node2D) -> void:
	state_machine.change_state($state_machine/wander)


#Collide with player
func _on_hitbox_body_entered(_body: Node2D) -> void:
	print("Attacking Player!")


func _on_health_component_died() -> void:
	queue_free()
