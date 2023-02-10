extends Node2D

var hp = 25 setget set_hp
var target = null

onready var hp_label = $HpLabel
onready var animation_player = $AnimationPlayer

signal died
signal end_turn


func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'hp'


func attack(target):
	yield(get_tree().create_timer(0.4), "timeout")
	animation_player.play("Attack")
	self.target = target
	yield(animation_player, "animation_finished")
	self.target = null
	emit_signal("end_turn")


func deal_damage():
	target.hp -= 4


func take_damage(amount):
	hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animation_player.play("Shake")

func is_dead():
	return hp <= 0
