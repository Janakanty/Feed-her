extends StaticBody2D

var thinks = ["tu jest coś napisane...","'...w razie problemów prosimy złożyć wniosek...'","'...od dnia 26 lipca do wniosku należy doczyć pozwolenie na ten wniosek...'","'...w godzinach 10:00 - 15:00 trwa przerwa na kawę. Prosimy o wyrozumiałość'","ehhh..."]

onready var player_pom = get_node("../Player/Camera2D/CanvasLayer")
export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)
var close = false
var wniosek = false

onready var player = get_node("../Player")

func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LPM") and close == false :
		yield(get_tree().create_timer(0.01), "timeout")
		player.stop_player()
		player.za_daleko()
	elif event.is_action_pressed("LPM") and close == true :
		yield(get_tree().create_timer(0.2), "timeout")
		player.stop_player()
		player.think_panel(thinks)
		#player_pom.add_child()


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false


