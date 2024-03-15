extends Node

@export var turn:int

func _ready():
	turn = 0

func _take_turn():
	turn = turn + 1
