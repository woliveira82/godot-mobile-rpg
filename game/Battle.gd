extends Node

const BattleUnits = preload("res://game/BattleUnits.tres")

export(Array, PackedScene) var enemies = []

onready var battle_action_buttons = $UI/BattleActionButtons
onready var next_room_button = $UI/CenterContainer/NextRoomButton
onready var animation_player = $AnimationPlayer
onready var enemy_position = $Position2D


func _ready():
	randomize()
	start_player_turn()
	var enemy = BattleUnits.Enemy
	if enemy != null:
		enemy.connect("died", self, "_on_Enemy_died")


func start_enemy_turn():
	battle_action_buttons.hide()
	var enemy = BattleUnits.Enemy
	if enemy != null and not enemy.is_queued_for_deletion():
		enemy.attack()
		yield(enemy, "end_turn")
	
	start_player_turn()


func start_player_turn():
	battle_action_buttons.show()
	BattleUnits.Player.ap = BattleUnits.Player.max_ap


func _on_Enemy_died():
	next_room_button.show()
	battle_action_buttons.hide()


func _on_PlayerStatus_end_turn():
	start_enemy_turn()


func _on_NextRoomButton_pressed():
	next_room_button.hide()
	animation_player.play("FadeToNewRoom")
	yield(animation_player, "animation_finished")
	battle_action_buttons.show()
	var player = BattleUnits.Player
	player.ap = player.max_ap
	_create_a_new_enemy()


func _create_a_new_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var enemy = Enemy.instance()
	enemy_position.add_child(enemy)
	enemy.connect("died", self, "_on_Enemy_died")
	
