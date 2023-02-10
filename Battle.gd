extends Node

onready var enemy = $Enemy
onready var battle_action_buttons = $UI/BattleActionButtons


func _on_SwordButton_pressed():
	if enemy != null:
		enemy.hp -= 4


func _on_Enemy_died():
	enemy = null
	battle_action_buttons.hide()
	
