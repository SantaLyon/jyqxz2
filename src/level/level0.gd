extends Control

onready var background = $Background
onready var sprite = $npc/sprite

var bg = [
	preload("res://asset/image/scene/Image 170.jpg"),
	preload("res://asset/image/scene/Image 187.jpg")
]

var npc = [
	preload("res://asset/image/npc/Image 172.jpg"),
	preload("res://asset/image/npc/Image 190.jpg")
]

func _ready():
	GameUI.chapter_start("失德医生")
	yield(GameUI,"chapter_over")
	change_scene(0)
	GameUI.chapter_start("母亲病重")
	yield(GameUI,"chapter_over")
	change_scene(1)
	
func change_scene(id:int):
	SceneChanger.animation.play("heimu")
	yield(SceneChanger.animation,"animation_finished")
	background.texture = bg[id]
	sprite.texture = npc[id]
	SceneChanger.animation.play_backwards("heimu")
	yield(SceneChanger.animation,"animation_finished")
