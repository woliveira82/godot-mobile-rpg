extends Node

onready var enemy = $Enemy
onready var sword_button = $UI/SwordButton


func _on_SwordButton_pressed():
	if enemy != null:
		enemy.hp -= 4


func _on_Enemy_died():
	enemy = null
	sword_button.hide()
	
