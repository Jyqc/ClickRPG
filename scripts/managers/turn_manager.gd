extends Node
<<<<<<< HEAD
<<<<<<< HEAD
# Uniques names
@onready var logBox = %LogBox
@onready var turnLabel = %TurnLabel

# Exported variables
@export var currentTurn:int


func _ready():
	currentTurn = 1
	turnLabel.text = str(currentTurn)
=======

@onready var logBox = %LogBox
@onready var currentTurn:int = 1
>>>>>>> 63cc6be590aca8f9856419181b552cefb5d26c3d
=======

@onready var logBox = %LogBox
@onready var currentTurn:int = 1
>>>>>>> 63cc6be590aca8f9856419181b552cefb5d26c3d

func add_log_entry(entry:String):
	logBox.text =("Turn "+(str(currentTurn)+" : "+entry)) + ("\n"+logBox.text)

func next_turn():
	currentTurn += 1
<<<<<<< HEAD
<<<<<<< HEAD
	turnLabel.text = str(currentTurn)
=======
>>>>>>> 63cc6be590aca8f9856419181b552cefb5d26c3d
=======
>>>>>>> 63cc6be590aca8f9856419181b552cefb5d26c3d
