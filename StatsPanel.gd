extends Panel

onready var hp_label = $StatusContainer/HP
onready var ap_label = $StatusContainer/AP
onready var mp_label = $StatusContainer/MP


func _on_PlayerStatus_hp_changed(value):
	hp_label.text = "HP\n" + str(value)


func _on_PlayerStatus_ap_changed(value):
	ap_label.text = "AP\n" + str(value)


func _on_PlayerStatus_mp_changed(value):
	mp_label.text = "MP\n" + str(value)
