extends Label

func _on_Score_update_highscore():
	text = get_node("/root/World/UI/Score").text
	pass
