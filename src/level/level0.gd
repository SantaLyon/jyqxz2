extends Control

var levels = [
{
	"background":"res://asset/image/scene/Image 138.jpg",
	"npc":[
		{
			"avatar":"res://asset/image/npc/Image 150.jpg",
			"postion":{
				"x":456.309,
				"y":402.538
			},
			"show":true
		}
	]
},
{
	"background":"res://asset/image/scene/Image 170.jpg",
	"npc":[
		{
			"avatar":"res://asset/image/npc/Image 172.jpg",
			"postion":{
				"x":456.309,
				"y":402.538
			},
			"show":true
		}
	]
},
{
	"background":"res://asset/image/scene/Image 187.jpg",
	"npc":[
		{
			"avatar":"res://asset/image/npc/Image 190.jpg",
			"postion":{
				"x":456.309,
				"y":402.538
			},
			"show":false
		}
	]
}
]


func _ready():
#	Dialog.chapter_start("失德医生")
#	yield(Dialog,"chapter_over")
	Dialog.chapter_start("母亲病重")
	yield(Dialog,"chapter_over")
	Dialog.chapter_start("为母寻药")
	yield(Dialog,"chapter_over")
	print("over")

func scene_build(index):
	var level_index = index[0]
	var current_level = levels[level_index]
	$Background.texture = load(current_level["background"])
	var npcs = current_level["npc"]
	for i in npcs.size():
		var npc = load("res://src/npc.tscn").instance()
		add_child(npc)
		npc.set_sprite(npcs[i]["avatar"])
		npc.position = Vector2(npcs[i]["postion"]["x"],npcs[i]["postion"]["y"])
		if npcs[i]["show"]:
			npc.show()
		else:
			npc.hide()
			
func npc_hide():
	var npcs = get_tree().get_nodes_in_group("npc")
	for i in npcs.size():
		npcs[i].hide()

func npc_queue_free():
	var npcs = get_tree().get_nodes_in_group("npc")
	for i in npcs.size():
		npcs[i].queue_free()

func npc_show():
	var npcs = get_tree().get_nodes_in_group("npc")
	for i in npcs.size():
		npcs[i].show()

func node_animation_play(args):
	$AnimationPlayer.play(args[0])
	
func node_animation_play_backwards(args):
	$AnimationPlayer.play_backwards(args[0])

