extends "res://game/ui/ActionButton.gd"

const Slash = preload("res://game/Slash.tscn")


func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node("Enemy")
	var player = main.find_node("PlayerStatus")
	if enemy != null and player != null:
		create_slash(enemy.global_position)
		enemy.take_damage(4)
		player.mp += 2
		player.ap -= 1


func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position
