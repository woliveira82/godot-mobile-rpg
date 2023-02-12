extends Node2D

const BattleUnits = preload("res://game/BattleUnits.tres")


export(int) var hp = 25 setget set_hp
export(int) var damage = 4

onready var hp_label = $HpLabel
onready var animation_player = $AnimationPlayer

signal died
signal end_turn


func _ready():
	BattleUnits.Enemy = self


func _exit_tree():
	BattleUnits.Enemy = null


func set_hp(new_hp):
	hp = new_hp
	if hp_label != null:
		hp_label.text = str(hp) + 'hp'


func attack():
	yield(get_tree().create_timer(0.4), "timeout")
	animation_player.play("Attack")
	yield(animation_player, "animation_finished")
	emit_signal("end_turn")


func deal_damage():
	if BattleUnits.Player != null:
		BattleUnits.Player.hp -= damage


func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animation_player.play("Shake")

func is_dead():
	return hp <= 0
