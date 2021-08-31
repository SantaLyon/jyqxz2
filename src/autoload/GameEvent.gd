extends Node

signal event_finish

onready var animation = $AnimationPlayer

func event_shady():
	animation.play("event_shady")
	yield(animation,"animation_finished")
	emit_signal("event_finish")

func event_cough_audio():
	animation.play("event_cough_audio")
	yield(animation,"animation_finished")
	emit_signal("event_finish")

func event_tiger_audio():
	animation.play("event_tiger_audio")
	yield(animation,"animation_finished")
	emit_signal("event_finish")

func event_attack_tiger():
	animation.play("event_attack_tiger")
	yield(animation,"animation_finished")
	emit_signal("event_finish")

func event_battle_video(parameter):
	print(parameter)
	animation.play("event_shady")
#	animation.play("event_battle_video")
	yield(animation,"animation_finished")
	emit_signal("event_finish")


func event_get_item_by_id(parameter):
	print("event_get_item_by_id")
	print(parameter)
	yield(get_tree(),"idle_frame")
	emit_signal("event_finish")

