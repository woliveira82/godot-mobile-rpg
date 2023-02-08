extends Node2D


var hp = 25 setget set_hp

onready var hp_label = $HpLabel


func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'hp'
