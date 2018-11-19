extends Label

signal update_highscore

var isEnded = false
var score = 0
var bestScore = 0

func _ready():
	var timer = Timer.new()
	timer.connect("timeout", self, "increment_score")
	timer.set_wait_time(0.1)
	add_child(timer)
	timer.start()
	pass

func game_ended():
	score = 0

func increment_score():
	text = str(score)
	score += int(get_node("/root/World/OfflinePlayer").get("speed") / 900)
	if int(get_node("/root/World/UI/Highscore").text) < score:
		emit_signal("update_highscore")
