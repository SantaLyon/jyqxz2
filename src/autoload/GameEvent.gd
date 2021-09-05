extends Node

signal event_finish

func global_audio_play(parameter:String):
	$GlobalAnimationPlayer.play(parameter)
	yield($GlobalAnimationPlayer,"animation_finished")
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
	yield(get_tree(),"idle_frame")
	emit_signal("event_finish")
	
func event_get_item_by_id(parameter):
	print("event_get_item_by_id")
	print(parameter)
	yield(get_tree(),"idle_frame")
	emit_signal("event_finish")

