extends Node

# Unique names
@onready	var playerHpLabel = %PlayerHpLabel
@onready	var playerAttackLabel = %PlayerAttackLabel
@onready	var waveHpLabel = %WaveHpLabel
@onready	var waveAttackLabel = %WaveAttackLabel
@onready	var diceLabel = %DiceLabel
@onready	var turnManager = %TurnManager

#Exported variables
@export var inCombat:bool
@export var playerHp:int
@export var playerAttack:int
@export var playerAttackLevel:int
@export var waveHp:int
@export var waveAttack:int
@export var damage_done:int
@export var damage_received:int

#Engines
var diceEngine = DiceEngine.new()
var spawnEngine = SpawnEngine.new()

func _ready():
	inCombat = false
	playerHp = 100
	playerAttack = 10
	playerAttackLevel = 1
	waveHp = 0
	waveAttack = 0
	damage_done = 0
	damage_received = 0
	playerHpLabel.text = (str (playerHp))
	playerAttackLabel.text = (str (playerAttack))

func _on_spawn_button_pressed():
	spawnEngine.spawn_wave()
	waveHp = spawnEngine.waveHp
	waveAttack = spawnEngine.waveAttack
	waveHpLabel.text = (str (waveHp))
	waveAttackLabel.text = (str (waveAttack))
	inCombat = true


func _on_attack_button_pressed():
	if inCombat == true:
		if playerHp > 1:
			
			## Attack phase
			diceEngine.roll_dice(playerAttack)
			damage_done = diceEngine.diceRollResult
			diceLabel.text = (str (diceEngine.diceRollResult))
			waveHp = waveHp - damage_done
			waveHpLabel.text = (str (waveHp))
			diceEngine.diceRollResult = 0
			## Defense phase
			diceEngine.roll_dice(waveAttack)
			damage_received = diceEngine.diceRollResult
			playerHp = playerHp - damage_received
			playerHpLabel.text = (str (playerHp))
			diceEngine.diceRollResult = 0
			if playerHp < 1:
				playerHpLabel.text = "Dead"
				turnManager.add_log_entry("Player dead")
			if waveHp < 1:
				turnManager.add_log_entry((str(damage_received)+" damage received and ") +(str(damage_done)+" damage done." + " Wave killed"))
				turnManager.next_turn()
				waveHpLabel.text = "Dead"
				inCombat = false
			else:
				turnManager.add_log_entry((str(damage_received)+" damage received and ") +(str(damage_done)+" damage done."))
				turnManager.next_turn()
		else:
			turnManager.add_log_entry("Not enough hp to attack")



func _on_upgrade_attack_button_pressed():
	playerAttackLevel += 1
	playerAttack = 10 * playerAttackLevel
	playerAttackLabel.text = (str (playerAttack))
