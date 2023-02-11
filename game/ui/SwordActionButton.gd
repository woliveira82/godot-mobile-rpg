extends "res://game/ui/ActionButton.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node("Enemy")
	var player = main.find_node("PlayerStatus")
	if enemy != null and player != null:
		enemy.take_damage(4)
		player.mp += 2
		player.ap -= 1
