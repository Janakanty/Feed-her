extends Node2D



func _ready():
	playmusic()
	$AnimationPlayer.play("Nowa animacja")
	
func playmusic():
	yield(get_tree().create_timer(1),"timeout")
	$AudioStreamPlayer.play()


