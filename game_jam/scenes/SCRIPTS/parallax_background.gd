extends ParallaxBackground

var speed = 25

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta
	if Global.chap_choise % len(Global.chapter_comp) != 0:
		if Global.white_room == true:
			$"../TileMap2".visible= false
			$"../TileMap".visible = true
			$BLayer.visible = false
			$Wlayer.visible = true
		else:
			$"../TileMap2".visible = true
			$"../TileMap".visible = false
			$BLayer.visible = true
			$Wlayer.visible = false
