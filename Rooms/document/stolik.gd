extends StaticBody2D


export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)
var close = false
var wniosek = false

onready var player = get_node("../Player")
onready var playr_wniosek = get_node("../Player/Camera2D/CanvasLayer/HBoxContainer/3")

var thinks = ["Eh... gdzie ten wniosek teraz wypełnić?"]
var thinks2 = ["Jeszcze raz. Teraz tylko podejść do odpowiedniego okna"]

func start_document():
	get_node("../okienko1").start_form()
	get_node("../okienko2").start_form()
	get_node("../okienko3").start_form()

func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("LPM") and close == false :
		yield(get_tree().create_timer(0.01), "timeout")
		player.stop_player()
		player.za_daleko()
	if event.is_action_pressed("LPM") and close == true and wniosek == false :
		playr_wniosek.visible = true
		yield(get_tree().create_timer(0.2), "timeout")
		player.stop_player()
		player.think_panel(thinks)
		wniosek = true
		Global.nowy_wniosek = true
		start_document()
	elif event.is_action_pressed("LPM") and wniosek == true:
		player.think_panel(thinks2)
		playr_wniosek.visible = true
		yield(get_tree().create_timer(0.2), "timeout")
		player.stop_player()
		Global.reset_okien()
		start_document()
		


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true


func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false

