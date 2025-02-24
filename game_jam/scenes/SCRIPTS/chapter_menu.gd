extends Node2D

var scn = {
	0: 'res://scenes/chapter_i.tscn',
	1: 'res://scenes/chapter_ii.tscn',
	2: 'res://scenes/chapter_menu.tscn',
	3: 'res://scenes/chapter_menu.tscn',
	4: 'res://scenes/chapter_menu.tscn',
	5: 'res://scenes/chapter_menu.tscn'
}

@onready var uiflag = [
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet,
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet2,
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet3,
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet4,
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet5,
	$Label2/Label3/UiIconsBlackPixelArtSpriteSheet6
]

var aces = Global.chapter_comp

func uitrig():
	for i in range(6):
		if Global.chap_choise % len(scn) == i:
			uiflag[i].visible = true
		else:
			uiflag[i].visible = false

func _ready() -> void:
	if Global.fl:
		Global.chap_choise += 1
	else:
		Global.fl = true
	uitrig()
	
	
	if aces[0]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet.visible = true
	if aces[1]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet2.visible = true
	if aces[2]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet3.visible = true
	if aces[3]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet4.visible = true
	if aces[4]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet5.visible = true
	if aces[5]:
		$Label2/Label2/UiIconsBlackPixelArtSpriteSheet6.visible = true
	
	
	

func _on_button_pressed() -> void:
	Global.chap_choise = 0
	uitrig()
	

func _on_button_2_pressed() -> void:
	Global.chap_choise = 1
	uitrig()

func _on_button_3_pressed() -> void:
	Global.chap_choise = 2
	uitrig()

func _on_button_4_pressed() -> void:
	Global.chap_choise = 3
	uitrig()

func _on_button_5_pressed() -> void:
	Global.chap_choise = 4
	uitrig()

func _on_button_6_pressed() -> void:
	Global.chap_choise = 5
	uitrig()


func _on_button_7_pressed() -> void:
	get_tree().change_scene_to_file(scn[Global.chap_choise % len(scn)])
	


func _on_mutooooon_pressed() -> void:
	Global.chap_choise -= 1
	get_tree().change_scene_to_file("res://main_menu.tscn")
