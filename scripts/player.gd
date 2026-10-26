extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent

var attackers: Dictionary = {}
var speed: float = 100.0
var is_dodging = false


func _ready() -> void:
	health_component.setup(2)
	
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if is_dodging == false:
		if input_direction == Vector2.ZERO:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")

		if input_direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif input_direction.x > 0:
			$AnimatedSprite2D.flip_h = false
			
	if Input.is_action_just_pressed("dodge"):
		is_dodging = true
		$AnimatedSprite2D.play("dodge")

	velocity = input_direction * speed
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "dodge":
		is_dodging = false
		
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

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

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		attackers[body] = 0.0

func _on_health_component_died() -> void:
	print("Player has died")
	$AnimatedSprite2D.play("death")
