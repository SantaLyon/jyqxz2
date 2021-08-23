extends Node

var player_data = {
	"xingshi":"",
	"mingzi":"",
	"shengming":0,
	"neili":0,
	"lidao":0,
	"huti":0,
	"shenfa":0,
	"yishu":0,
	"yongdu":0,
	"jiedu":0,
	"quanzhang":0,
	"yujian":0,
	"anqi":0,
	"wuxing":0,
	"fuyuan":0
}

onready var dialog_left = $Dialog_left
onready var avatar_left = $Dialog_left/Avatar
onready var name_left = $Dialog_left/Name
onready var content_left = $Dialog_left/Content
onready var dialog_right = $Dialog_right
onready var avatar_right = $Dialog_right/Avatar
onready var name_right = $Dialog_right/Name
onready var content_right = $Dialog_right/Content

var current_dialog_count = 0

var dialog_list = {
	"id0":{
		"data":[
			{
				"avatar":"res://asset/image/player/Image 144.jpg",
				"name":"player",
				"content":{
					"is_option":false,
					"text":"大夫，我母亲病现在越来越重，您能不能过去瞧瞧？如果您不方便，先帮我抓几副药吧？",
					"option":[]
				}
			},
			{
				"avatar":"res://asset/image/npc/Image 150.jpg",
				"name":"大夫",
				"content":{
					"is_option":false,
					"text":"小子，你知道老夫出一次诊的诊金是多少吗？是20两纹银！你有吗？如果没有，就少在这里扯淡！",
					"option":[]
				}
			},
			{
				"avatar":"res://asset/image/player/Image 144.jpg",
				"name":"player",
				"content":{
					"is_option":false,
					"text":"大夫，实在对不住，我现在半两纹银也凑不起。人称您是“在世华佗”，请您积积功德。日后我一定会把银子如数交上的。",
					"option":[]
				}
			},
			{
				"avatar":"res://asset/image/npc/Image 150.jpg",
				"name":"大夫",
				"content":{
					"is_option":false,
					"text":"老夫又不是开慈善堂！平日里积的阴德也够多了，也不差你一个。滚吧，滚吧，老夫还要睡觉。",
					"option":[]
				}
			},
		]
	},
	"id1":{
		"data":[
			{
				"avatar":"res://asset/image/player/Image 144.jpg",
				"name":"player",
				"content":{
					"is_option":false,
					"text":"大夫！大夫！你开开门！怎么可以见死不救呢？？！你还有没有医德？！我娘要是有个三长两短，我不会放过你的！",
					"option":[]
				}
			},
		]
	}
}


func open_dialog(_dialog:Array):
	if current_dialog_count % 2 == 0:
		_show_dialog_left(_dialog[current_dialog_count])
	else:
		_show_dialog_right(_dialog[current_dialog_count])
	
func _show_dialog_left(dict:Dictionary):
	dialog_right.hide()
	avatar_left.texture = load(dict.avatar)
	if dict.name == "player":
		dict.name = player_data.xingshi + player_data.mingzi
	name_left.text = dict.name
	content_left.bbcode_text = dict.content["text"]
	dialog_left.show()
	
func _show_dialog_right(dict:Dictionary):
	dialog_left.hide()
	avatar_right.texture = load(dict.avatar)
	if dict.name == "player":
		dict.name = player_data.xingshi + player_data.mingzi
	name_right.text = dict.name
	content_right.bbcode_text = dict.content["text"]
	dialog_right.show()
	
func hide_dialog():
	dialog_left.hide()
	dialog_right.hide()
