extends Node2D
class_name RoomManager

@export var room_scene: PackedScene

var room_count: int = 0
var room_type: String						#3 Types: Normal, Treasure, Boss Room
var boss_killed: bool = false

func _ready() -> void:
	spawn_doors()
	print(room_count)

func spawn_doors() -> void:
	var current_room = room_scene.instantiate()
	add_child(current_room)
	room_count += 1
