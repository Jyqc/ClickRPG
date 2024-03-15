extends Node

@onready var dice_one_label = %DiceOneLabel
@onready var dice_two_label = %DiceTwoLabel
@onready var dice_three_label = %DiceThreeLabel
@onready var dice_total_label = %DiceTotalLabel
@onready var combat_engine = %CombatEngine
@export var dice_total_value:int

func _on_roll_button_pressed():
	var dice_one_value = randi_range(0,10)
	print(str(dice_one_value))
	dice_one_label.text = (str(dice_one_value))
	var dice_two_value = randi_range(0,10)
	dice_two_label.text = (str(dice_two_value))
	var dice_three_value = randi_range(0,10)
	dice_three_label.text = (str(dice_three_value))
	dice_total_value = dice_one_value+dice_two_value+dice_three_value
	dice_total_label.text = (str(dice_total_value))
	if combat_engine.in_combat == true:
		print("Engine in combat")
		if combat_engine.boss_hp > 0:
			combat_engine.boss_hp = combat_engine.boss_hp - dice_total_value
			print(str(dice_total_value)+" damage done")
			combat_engine.boss_hp_label.text = (str (combat_engine.boss_hp))
		else:
			print("Boss dead")
			combat_engine.boss_hp_label.text = (str (0))
			combat_engine.in_combat = false
