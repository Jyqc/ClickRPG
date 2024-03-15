extends Node

@onready var wave_hp_label = %WaveHpLabel
@onready var dice_engine = %DiceEngine
@export var in_combat:bool = false
@export var wave_hp:int = 0

func _on_spawn_button_pressed():
	if in_combat == false:
		in_combat = true
		print("In combat")
		wave_hp = 200
		wave_hp_label.text = (str(wave_hp))
	else:
		print("Kill the wave first")
		
func _on_attack_button_pressed():
	if in_combat == true:
		if dice_engine.dice_total_value == 0:
			print("Roll the dices first")
		else:	
			wave_hp = wave_hp - dice_engine.dice_total_value
			print(str(dice_engine.dice_total_value)+" damage done")
			wave_hp_label.text = (str (wave_hp))
			dice_engine.dice_total_value = 0
			dice_engine.dice_total_label.text = (str(dice_engine.dice_total_value))
			if wave_hp < 1:
				print("Wave killed")
				wave_hp_label.text = "Dead"
				in_combat = false
