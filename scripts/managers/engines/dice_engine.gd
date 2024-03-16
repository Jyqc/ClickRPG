class_name DiceEngine
extends Node

@onready var diceRollResult:int = 0

func roll_dice(d:int):
	diceRollResult = randi_range(1,d)
