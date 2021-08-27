extends CanvasLayer

onready var animation = $AnimationPlayer

func goto(path : String):
	$ColorRect.show()
	animation.play("change")
	yield(animation,"animation_finished")
	var success = get_tree().change_scene(path)
	if success == OK:
		print("切换场景成功")
	else:
		print("切换场景失败")
	$ColorRect.hide()


