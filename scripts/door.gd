extends Area2D
class_name Door





func _on_body_entered(body: Node2D) -> void:
	print(body)



func _on_body_exited(body: Node2D) -> void:
	print("Body Left")
