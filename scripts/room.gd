extends Node2D
class_name Room

@onready var top: Marker2D = $DoorPositions/top
@onready var right: Marker2D = $DoorPositions/right
@onready var down: Marker2D = $DoorPositions/down
@onready var left: Marker2D = $DoorPositions/left

@onready var room_location: Array = [top, right, down, left]
#top   =  567.0, 17.0
#right =  1144.0, 329.0
#down  =  569.0, 623.0
#left  =  6.0, 329.0

var enemies_alive: int
var enemies_killed: int = 0
var door_entered: bool = false


func _ready() -> void:
	spawn_door()
	enemies_alive = enemy_amount()
	
func spawn_door() -> void:
	room_location.shuffle()
	
	var door_one = room_location[0].global_position
	var door_two = room_location[1].global_position
	print(door_one, door_two)


func enemy_amount() -> int:
	return randi_range(1, 6)
	
	
	


	
	
