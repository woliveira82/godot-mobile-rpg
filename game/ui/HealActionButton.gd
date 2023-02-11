extends "res://game/ui/ActionButton.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var player = main.find_node("PlayerStatus")
	if player != null:
		if player.mp >= 8:
			player.hp += 5
			player.mp -= 8
			player.ap -= 1
