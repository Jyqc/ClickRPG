extends Node

@onready var dice_one_label = %DiceOneLabel
@onready var dice_two_label = %DiceTwoLabel
@onready var dice_three_label = %DiceThreeLabel
@onready var dice_total_label = %DiceTotalLabel
@export var dice_total_value:int

func _on_roll_button_pressed():
	# Dice roll
	var dice_one_value = randi_range(0,10)
	dice_one_label.text = (str(dice_one_value))
	var dice_two_value = randi_range(0,10)
	dice_two_label.text = (str(dice_two_value))
	var dice_three_value = randi_range(0,10)
	dice_three_label.text = (str(dice_three_value))
	dice_total_value = dice_one_value+dice_two_value+dice_three_value
	dice_total_label.text = (str(dice_total_value))
