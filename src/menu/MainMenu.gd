extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("juan_zhou_zhan_kai")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("yun_duo")
	


func _chu_ru_jiang_hu_pressed():
	SceneChanger.goto("res://src/menu/PlayerCreate.tscn")
