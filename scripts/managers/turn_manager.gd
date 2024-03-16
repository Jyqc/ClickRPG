extends Node

@onready var logBox = %LogBox
@onready var currentTurn:int = 1

func add_log_entry(entry:String):
	logBox.text =("Turn "+(str(currentTurn)+" : "+entry)) + ("\n"+logBox.text)

func next_turn():
	currentTurn += 1
