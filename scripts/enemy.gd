extends CharacterBody2D

@onready var detection: Area2D = $Detection
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $state_machine

var player_pos: Node2D
var enemy_roam_speed: float = 15.0
var enemy_direction: Vector2



func _physics_process(_delta: float) -> void:
	move_and_slide()


func _on_detection_body_entered(body: Node2D) -> void:
	player_pos = body
	state_machine.change_state($state_machine/follow)


func _on_detection_body_exited(_body: Node2D) -> void:
	state_machine.change_state($state_machine/wander)
