extends StaticBody2D


var thinks = ["Słychać tylko szumy", "i jakąś melodię?"]
var thinks2 = ["Cholera, potrzebuję monet", "chyba jakieś gdzieś widziałem"]
var close = false
onready var player = get_node("../Player")

export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)



func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LPM") and close == true :
		if Global.monety == true:
			player.zoom_camera_animation()
			$AudioStreamPlayer2D.play()
			yield(get_tree().create_timer(0.2), "timeout")
			player.stop_player()
			yield(get_tree().create_timer(5), "timeout")
			player.think_panel(thinks)
		else:
			player.think_panel(thinks2)
			yield(get_tree().create_timer(0.2), "timeout")
			player.stop_player()
	elif event.is_action_pressed("LPM") and close == false: 
		player.za_daleko()
		
func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false
