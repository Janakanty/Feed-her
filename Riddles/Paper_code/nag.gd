extends StaticBody2D

export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)

var close = false
onready var player = get_node("../Player")
onready var player_pom = get_node("../Player/Camera2D/CanvasLayer")



func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LPM") and close == true :
		yield(get_tree().create_timer(0.2), "timeout")
		player.stop_player()
		var paper = preload("res://Riddles/Paper_code/Paper.tscn").instance()
		player_pom.add_child(paper)

func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false
