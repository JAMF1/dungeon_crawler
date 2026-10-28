class_name PlayerWeapon
extends Node2D

signal hit
@export var damage: int
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var hitbox: Area2D = $swingpivot/blade/Hitbox

var is_swinging := false
var _already_hit: Array = []

func _ready() -> void:
	hitbox.monitoring = false
	hitbox.body_entered.connect(_on_hitbox_body_entered)

func _process(_delta: float) -> void:
	if not is_swinging:
		rotation = (get_global_mouse_position() - global_position).angle()
		scale.y = -1.0 if abs(rotation) > PI / 2.0 else 1.0

	if Input.is_action_just_pressed("attack"):
		swing()

func swing() -> void:
	if is_swinging:
		return
	is_swinging = true
	_already_hit.clear()
	anim.play("swing")
	await anim.animation_finished
	is_swinging = false

func _on_hitbox_body_entered(body: Node) -> void:
	if body in _already_hit:
		return
	if body is Enemy:
		_already_hit.append(body)
		body.health.take_damage(damage)
		hit.emit()

func update_damage(updated_damage: int) -> void:
	damage = updated_damage
