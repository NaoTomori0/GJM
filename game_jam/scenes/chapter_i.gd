extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.chapter_comp[Global.chap_choise % len(Global.chapter_comp)] = 1
	get_tree().change_scene_to_file("res://scenes/chapter_menu.tscn")
