class_name StateClass
extends Node

var owner_node: CharacterBody2D
signal Transition

func setup(parent_node: CharacterBody2D) -> void:
	owner_node = parent_node

func enter() -> void:
	pass
	
func exit():
	pass
	
func update(_delta: float):
	pass
	
func physics_update(_delta: float): 
	pass
