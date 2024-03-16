class_name SpawnEngine
extends Node

@onready var waveHp:int = 0
@onready var waveAttack:int = 0
@onready var waveName:String

func spawn_wave():
		waveHp = 200
		waveAttack = 10
		waveName = "WolfPack"
		
