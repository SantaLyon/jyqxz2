extends Control

var list = GameStatus.dialog_list["id0"].data
#章节结束标记
var chapter_over = false

func _ready():
	GameStatus.open_dialog(list)
	GameStatus.current_dialog_count += 1

func _input(event):
	if event.is_action_pressed("ui_accept"):
#		print(GameStatus.current_dialog_count)
		if GameStatus.current_dialog_count < list.size():
			GameStatus.open_dialog(list)
			GameStatus.current_dialog_count += 1
		else:
			GameStatus.current_dialog_count = 0
			if !chapter_over:
				GameStatus.hide_dialog()
				SceneChanger.black_rect()
				yield(SceneChanger,"black_rect_over")
				list = GameStatus.dialog_list["id1"].data
				chapter_over = true
			else:
				GameStatus.hide_dialog()
				GameStatus.current_dialog_count = 0
				SceneChanger.goto("res://src/level/level1.tscn")
