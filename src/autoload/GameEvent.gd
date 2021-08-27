extends Node

signal event_finish


func event_shady():
	SceneChanger.animation.play("heimu")
	yield(SceneChanger.animation,"animation_finished")
	emit_signal("event_finish")

func event_cough_audio():
	$AudioStreamPlayer.stream = load("res://asset/music/Sound 179.mp3")
	$AudioStreamPlayer.playing = true
	$Timer.wait_time = 4
	$Timer.start()
	yield($Timer,"timeout")
	$AudioStreamPlayer.playing = false
	emit_signal("event_finish")

func event_battle_video():
	pass

