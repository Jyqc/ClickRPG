extends Node

@onready var combatPanel = %CombatPanel
@onready var testPanel = %TestPanel
@onready var activePanel = %Gui

func _on_combat_panel_button_toggled(toggled_on):
	if activePanel == %Gui:
		pass
	else:
		activePanel.visible = false
		
	combatPanel.visible = true
	activePanel = combatPanel

func _on_test_button_toggled(toggled_on):
	if activePanel == %Gui:
		pass
	else:
		activePanel.visible = false
		
	testPanel.visible = true
	activePanel = testPanel
