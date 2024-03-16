extends Node
# Uniques names
@onready var logBox = %LogBox
@onready var turnLabel = %TurnLabel

# Exported variables
@export var currentTurn:int


func _ready():
	currentTurn = 1
	turnLabel.text = str(currentTurn)

func add_log_entry(entry:String):
	logBox.text =("Turn "+(str(currentTurn)+" : "+entry)) + ("\n"+logBox.text)

func next_turn():
	currentTurn += 1
	turnLabel.text = str(currentTurn)
