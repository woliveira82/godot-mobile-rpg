extends "res://game/ui/ActionButton.gd"


func _on_pressed():
	var player = BattleUnits.Player
	if player != null:
		if player.mp >= 8:
			player.hp += 5
			player.mp -= 8
			player.ap -= 1
