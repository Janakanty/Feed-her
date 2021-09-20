extends Node2D



func _ready():
	$AnimationPlayer.play("Nowa animacja")
	playmusic()
	if Global.drzwi_w_lv_1 == true:
		$YSort/Blood.visible = true
	
func playmusic():
	yield(get_tree().create_timer(2),"timeout")
	$AudioStreamPlayer.play()



