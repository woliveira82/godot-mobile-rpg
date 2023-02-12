extends Node

const BattleUnits = preload("res://game/BattleUnits.tres")

onready var battle_action_buttons = $UI/BattleActionButtons


func _ready():
	start_player_turn()


func start_enemy_turn():
	battle_action_buttons.hide()
	var enemy = BattleUnits.Enemy
	if enemy != null:
		enemy.attack()
		yield(enemy, "end_turn")
	
	start_player_turn()


func start_player_turn():
	battle_action_buttons.show()
	BattleUnits.Player.ap = BattleUnits.Player.max_ap


func _on_Enemy_died():
	battle_action_buttons.hide()


func _on_PlayerStatus_end_turn():
	start_enemy_turn()
