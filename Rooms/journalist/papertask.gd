extends StaticBody2D


var thinks = ["tu jest coś napisane...", "'skończ za mnie pracę młody'", "'wybierz nagłówki do jutrzejszej gazety i zrób to tak jak Cię uczyłem'","'spraw aby zadziałała wyobraźnia czytelnika'","'wywróć temat do góry nogami'","'no i na koniec pamietaj kto nam płaci i komu nie kibicujemy'", "'no wiesz, aby dało się czytać'","'pieniądze są w sejfie'"]

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
		yield(get_tree().create_timer(0.2), "timeout")
		player.stop_player()
		player.think_panel(thinks)
	elif event.is_action_pressed("LPM") and close == false: 
		player.za_daleko()
		
func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false
