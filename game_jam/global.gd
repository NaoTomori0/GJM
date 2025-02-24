extends Node

var lvls = {
	0: 'res://scenes/chapter_i.tscn',
	1: 'res://scenes/chapter_ii.tscn',
	2: 'res://scenes/chapter_menu.tscn',
	3: 'res://scenes/chapter_menu.tscn',
	4: 'res://scenes/chapter_menu.tscn',
	5: 'res://scenes/chapter_menu.tscn'
}


var switch_skill = false
var dable_jump_skill = false
var dashing_skill = false

var chap_choise = 0
var chapter_comp = [0, 0, 0, 0, 0, 0]

var fl = false

var white_room = true

func lvl_compleat():
	Global.chapter_comp[Global.chap_choise % len(Global.chapter_comp)] = 1
	get_tree().change_scene_to_file("res://scenes/chapter_menu.tscn")


func dead_and_res():
	get_tree().change_scene_to_file(lvls[Global.chap_choise % len(Global.chapter_comp)])
	
