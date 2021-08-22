extends CanvasLayer



func goto(path : String):
	$ColorRect.show()
	$AnimationPlayer.play("change")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(path)
	$ColorRect.hide()
