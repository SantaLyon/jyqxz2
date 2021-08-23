extends CanvasLayer

onready var animation = $AnimationPlayer

signal black_rect_over

func goto(path : String):
	$ColorRect.show()
	$AnimationPlayer.play("change")
	yield($AnimationPlayer,"animation_finished")
	var success = get_tree().change_scene(path)
	if success == OK:
		print("切换场景成功")
	else:
		print("切换场景失败")
	$ColorRect.hide()

func black_rect():
	$ColorRect.show()
	$AnimationPlayer.play("change")
	yield($AnimationPlayer,"animation_finished")
	emit_signal("black_rect_over")
	
