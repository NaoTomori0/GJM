extends Area2D



func _on_body_entered(body: Node2D) -> void:
	Global.dead_and_res()
