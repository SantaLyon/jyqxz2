extends Control

var dui_hua = GameStatus.get_local_dialog_data()["id2"].data
#章节结束标记
var chapter_over = false

func _ready():
	GameStatus.open_dialog(dui_hua)
	GameStatus.current_dialog_count += 1

func _input(event):
	if event.is_action_pressed("ui_accept"):
#		print(GameStatus.current_dialog_count)
		if GameStatus.current_dialog_count < dui_hua.size():
			GameStatus.open_dialog(dui_hua)
			GameStatus.current_dialog_count += 1
		else:
			GameStatus.hide_dialog()
			GameStatus.current_dialog_count = 0
			if !chapter_over:
				#播放咳嗽声
				$AudioStreamPlayer.playing = true
				$npc.hide()
				$Timer.start()
				yield($Timer,"timeout")
				$AudioStreamPlayer.playing = false
				$npc.show()
				dui_hua = GameStatus.get_local_dialog_data()["id3"].data
				chapter_over = true
			else:
				GameStatus.hide_dialog()
				GameStatus.current_dialog_count = 0
				SceneChanger.goto("res://src/level/level0.tscn")
