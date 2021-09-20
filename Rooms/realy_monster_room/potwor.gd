extends StaticBody2D

export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)
var close = false

onready var player = get_node("../Player")
onready var map = get_node("/root/Map")

#func zamiana_orla():
#	$AnimatedSprite


func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LPM") and close == true :
		player.stop_player()
		if Global.atrybut1 == true and Global.czy_bylo1 == false:
			Global.czy_bylo1 = true
			Global.atrybut1 = false
			$AudioStreamPlayer.play()
			map.animation1()
		elif Global.atrybut2 == true and Global.czy_bylo2 == false:
			Global.czy_bylo2 = true
			Global.atrybut1 = false
			$AudioStreamPlayer.play()
			map.animation2()
		elif Global.atrybut3 == true and Global.czy_bylo3 == false:
			Global.czy_bylo3 = true
			Global.atrybut3 = false
			$AudioStreamPlayer.play()
			map.animation3()
	elif event.is_action_pressed("LPM") and close == false :
		player.za_daleko()
		player.stop_player()



func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false

func wraw_die():
	$AudioStreamPlayer.play()
	yield( get_node("AudioStreamPlayer"), "finished" )
	$AudioStreamPlayer2.play()
	$Particles2D.emitting = true
	yield(get_tree().create_timer(3),"timeout")
	$Particles2D2.emitting = true
	map.die()
