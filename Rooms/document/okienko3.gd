extends StaticBody2D

export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)

var okienko1 = preload("res://Riddles/doc_code/1.png")
var okienko2 = preload("res://Riddles/doc_code/2.png")
var okienko3 = preload("res://Riddles/doc_code/3.png")
var good = preload("res://Riddles/doc_code/dym-4.png.png")

onready var player = get_node("../Player")

var close = false

func _ready():
	#start_form()
	pass
	
func start_form():
	yield(get_tree().create_timer(1), "timeout")
	$Sprite.texture = okienko1
	$AnimationPlayer.play("wejscie")

func check():
	if Global.okienko8 == true:
		$Sprite.texture = good
	elif Global.okienko7 == true:
		$Sprite.texture  = okienko1
	elif Global.okienko6 == true:
		$Sprite.texture  = okienko2
	elif Global.okienko5 == true:
		$Sprite.texture  = okienko1
	elif Global.okienko4 == true:
		$Sprite.texture  = okienko1
	elif Global.okienko3 == true:
		$Sprite.texture  = okienko2
	elif Global.okienko2 == true:
		$Sprite.texture  = okienko2
	elif Global.okienko1 == true:
		$Sprite.texture  = okienko2

func _on_Area2D_mouse_entered():
	set_modulate(mouse_over)


func _on_Area2D_mouse_exited():
	set_modulate(mouse_out)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Global.nowy_wniosek == true:
		if event.is_action_pressed("LPM") and close == false :
			yield(get_tree().create_timer(0.01), "timeout")
			player.stop_player()
			player.za_daleko()
		if event.is_action_pressed("LPM") and close == true :
			yield(get_tree().create_timer(0.2), "timeout")
			player.stop_player()
			if Global.okienko1 == false:
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko2 == false:
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko3 == false:
				Global.okienko3 = true
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko4 == false:
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko5 == false:
				Global.okienko5 = true
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko6 == false:
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko7 == false:
				check()
				$AnimationPlayer.play("wejscie")
			elif Global.okienko8 == false:
				check()
				$AnimationPlayer.play("wejscie")
			else: 
				check()
				$AnimationPlayer.play("wejscie")


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"): 
		close = true

func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"): 
		close = false

