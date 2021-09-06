extends Node

signal event_finish


func global_animation_play(parameter:String):
	$GlobalAnimationPlayer.play(parameter)
	yield($GlobalAnimationPlayer,"animation_finished")
	emit_signal("event_finish")

func global_video_play(parameter:String):
	$GlobalVideoPlayer.show()
	$GlobalVideoPlayer.stream = load(parameter)
	$GlobalVideoPlayer.play()
	yield($GlobalVideoPlayer,"finished")
	$GlobalVideoPlayer.hide()
	emit_signal("event_finish")

#使用此方法调用其他节点的事件
func call_node_event(parameter:Dictionary):
	var node_group:String = parameter["node_group"]
	var group_index:int = parameter["group_index"]
	var method_name:String = parameter["method_name"]
	var have_parameter:bool = parameter["have_parameter"]
	var node = get_tree().get_nodes_in_group(node_group)[group_index]
	if have_parameter:
		var node_parameter = parameter["node_parameter"]
		node.call(method_name,node_parameter)
	else:
		node.call(method_name)
	#添加一下方法 此方法才可以正确发出信号
	yield(get_tree().create_timer(1),"timeout")
	emit_signal("event_finish")
	
func event_get_item_by_id(parameter):
	$GlobalPopup/RichTextLabel.bbcode_text = "[center]你获得了[color=red][b]《 %s 》[/b][/color][/center]" % parameter
	$GlobalPopup.show()
	print("获取物品。物品ID： %s" % parameter)
	yield(get_tree().create_timer(2),"timeout")
	$GlobalPopup.hide()
	emit_signal("event_finish")

