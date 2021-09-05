extends CanvasLayer

onready var dialog_left = $Dialog_left
onready var avatar_left = $Dialog_left/Avatar
onready var name_left = $Dialog_left/Name
onready var content_left = $Dialog_left/Content
onready var option_left = $Dialog_left/ScBox/VBox
onready var dialog_right = $Dialog_right
onready var avatar_right = $Dialog_right/Avatar
onready var name_right = $Dialog_right/Name
onready var content_right = $Dialog_right/Content
onready var option_right = $Dialog_right/ScBox/VBox
onready var click_timer = $ClickTimer
#章节结束
signal chapter_over
#是否能进入下一段对话 默认为否
var can_click = false
#章节数据
var current_chapter = {}
#对话数据
var current_dialogue_data = {}
#演员数据
var current_actor_data = {}
#对话计数
var current_dialogue_count = 0
#当前分支
var current_dialogue_branch = "main"

func get_chapter_data() -> Dictionary:
	var file = File.new()
	file.open("res://data/dialog/_dialog-new.json",file.READ)
	return parse_json(file.get_as_text())
	

#章节演出开始
func chapter_start(chapter_name):
	current_chapter = get_chapter_data()[chapter_name]
	current_actor_data = current_chapter["actor"]
	current_dialogue_data = current_chapter["data"]
	current_dialogue_count = 0
	_show_dialog(current_dialogue_count)
	can_click = true
	
func _input(event):
	#	监听对话栏点击事件
	if event.is_action_pressed("ui_accept") and can_click:
		current_dialogue_count += 1
		_show_dialog(current_dialogue_count)

#func _process(_delta):
#	print(can_click)

func _show_dialog(index):
	if index >= current_dialogue_data.size():
		emit_signal("chapter_over")
	else:
		var data = current_dialogue_data[index]
		if data.branch == current_dialogue_branch:
			match data.type:
				"text":
					can_click = false
					var actor = current_actor_data[data.actor]
					#找到该句台词演员
					if actor.theme == "player":
						show_player_dialog(actor,data,"text")
					else:
						show_npc_dialog(actor,data)
					click_countdown()
				"event":
					#禁用点击
					can_click = false
	#				click_timer.pause_
					if data.have_parameter:
						GameEvent.call(data.method,data.parameter)
					else:
						GameEvent.call(data.method)
					yield(GameEvent,"event_finish")
					click_countdown()
					#事件结束自动进入下一段对话
					current_dialogue_count += 1
					_show_dialog(current_dialogue_count)
				"option":
					var actor = current_actor_data[data.actor]
					show_player_dialog(actor,data,"option")
					yield(GameEvent,"event_finish")
					print("option over. now branch is %s" % current_dialogue_branch)
				_:
					print("读取剧本类型错误")
		else:
			current_dialogue_count += 1
			_show_dialog(current_dialogue_count)

func show_player_dialog(actor:Dictionary,data:Dictionary,type:String):
	dialog_right.hide()
	avatar_left.texture = load(actor.avatar)
	if actor.name == "player":
		actor.name = GameStatus.player_data.xingshi + GameStatus.player_data.mingzi
	name_left.text = actor.name
	if type == "text":
		option_left.hide()
		content_left.show()
		content_left.bbcode_text = data.content
	elif type == "option":
		content_left.hide()
		option_left.show()
		for x in data.option.size():
			var option = load("res://src/autoload/OptionButtn.tscn").instance()
			option_left.add_child(option)
			option.text = data.option[x].text
			if data.option[x].have_parameter:
				option.connect("pressed",GameEvent,data.option[x].event,[data.option[x].parameter])
			else:
				option.connect("pressed",GameEvent,data.option[x].event)
			current_dialogue_branch = data.option[x].branch_id
	dialog_left.show()

func show_npc_dialog(actor:Dictionary,data:Dictionary):
	dialog_left.hide()
	avatar_right.texture = load(actor.avatar)
	if actor.name == "player":
		actor.name = GameStatus.player_data.xingshi + GameStatus.player_data.mingzi
	name_right.text = actor.name
	content_right.bbcode_text = data.content
	dialog_right.show()


func chapter_over():
	dialog_left.hide()
	dialog_right.hide()

func click_countdown():
	click_timer.start()
	yield(click_timer,"timeout")
	can_click = true
