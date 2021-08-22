extends Control


func _ready():
	$AnimationPlayer.play("start")
	yield($AnimationPlayer,"animation_finished")
	SceneChanger.goto("res://src/menu/MainMenu.tscn")
