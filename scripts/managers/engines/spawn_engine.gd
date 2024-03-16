class_name SpawnEngine
extends Node

@onready var waveHp:int = 0
@onready var waveAttack:int = 0

func spawn_wave():
		waveHp = 200
		waveAttack = 10
		
