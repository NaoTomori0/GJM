extends Control

func _on_button_pressed() -> void:
	if $Panel.visible:
		$Panel.visible = false
	else:
		$Panel.visible = true
