extends Node

func _on_Connect_pressed():
	var ip = $UI/Address.text
	ConnectionManager.on_join_game(ip)

func _on_Host_pressed():
	ConnectionManager.on_host_game()

