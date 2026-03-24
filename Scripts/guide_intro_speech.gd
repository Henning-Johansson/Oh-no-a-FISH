extends Node2D

# Variable values activated upon the programs start
@onready var text_box: Sprite2D = $TextBox
@onready var text_node: Node2D = $Text
@onready var npc_name: Label = $Text/NPCName
@onready var npc_speech_part_1: Label = $Text/NPCSpeechPart1
@onready var npc_speech_part_2: Label = $Text/NPCSpeeechPart2
@onready var continue_text: Label = $Text/ContinueLabel
@onready var end_text: Label = $Text/EndLabel

# Variable values
var speech_started: bool = false
var speech_section: int = 0

# The first thing the program does when called
func _ready() -> void:
	text_box.visible = false
	text_node.visible = false
	npc_name.visible = false
	npc_speech_part_1.visible = false
	npc_speech_part_2.visible = false
	continue_text.visible = false
	end_text.visible = false

# What the program does every frame
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("continue") and speech_started == true
	and speech_section == 1):
		text_box.visible = true
		text_node.visible = true
		npc_name.visible = true
		npc_speech_part_1.visible = false
		npc_speech_part_2.visible = true
		continue_text.visible = false
		end_text.visible = true
		speech_section = 2

# Shows the first part of the NPCs speech
func _on_player_start_speaking() -> void:
	text_box.visible = true
	text_node.visible = true
	npc_name.visible = true
	npc_speech_part_1.visible = true
	npc_speech_part_2.visible = false
	continue_text.visible = true
	speech_started = true
	speech_section = 1

# Ends the NPCs speech
func _on_player_stop_speaking() -> void:
	text_box.visible = false
	text_node.visible = false
	npc_name.visible = false
	npc_speech_part_1.visible = false
	npc_speech_part_2.visible = false
	continue_text.visible = false
	end_text.visible = false
	speech_started = false
	speech_section = 0
