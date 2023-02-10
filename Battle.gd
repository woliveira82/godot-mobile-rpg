extends Node

onready var player = $PlayerStatus
onready var enemy = $Enemy
onready var battle_action_buttons = $UI/BattleActionButtons


func _ready():
	start_player_turn()


func start_enemy_turn():
	battle_action_buttons.hide()
	if enemy != null:
		enemy.attack(player)
		yield(enemy, "end_turn")
	
	start_player_turn()


func start_player_turn():
	battle_action_buttons.show()
	player.ap = player.max_ap


func _on_SwordButton_pressed():
	if enemy != null:
		enemy.take_damage(4)
		player.ap -= 1


func _on_Enemy_died():
	enemy = null
	battle_action_buttons.hide()


func _on_PlayerStatus_end_turn():
	start_enemy_turn()
