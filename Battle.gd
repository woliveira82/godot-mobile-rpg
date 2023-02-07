extends Node

onready var hp_label = $Enemy/HpLabel


func _on_SwordButton_pressed():
	hp_label.text = '15hp'
