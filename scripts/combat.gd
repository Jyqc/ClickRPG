extends Node

@onready var boss_hp_label = %BossHpLabel

@export var in_combat:bool = false
@export var boss_hp:int = 0


func _on_fight_button_pressed():
	if in_combat == false:
		in_combat = true
		print("In Combat")
		boss_hp = 200
		boss_hp_label.text = (str(boss_hp))
