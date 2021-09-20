extends KinematicBody2D

#Light system
onready var srodek = get_node("Light2D").global_position
onready var player = get_parent().get_node("Player")
onready var dir_eye = srodek.direction_to(get_global_mouse_position())*1
onready var potwor_position = get_node("../potwor")

var daleko = ["za daleko"]

#Walk system
var moving = false
var speed = 80
var max_speed = 80
var movement = Vector2()
var destination = Vector2()
var move_direction = 1 
var acceleration = 1299

#Animation system
var anim_direction = "S"
var animation
var anim_mode

#Think system
var thinks_from
var think = 0
var think_panel = false

func _input(event):
	think_panel_next()
	
#func _ready():
#	zoom_to_monster()
#	yield(get_tree().create_timer(2),"timeout")
#	zoom_to_monster_back()
	
	if Global.monety == true:
		get_node("Camera2D/CanvasLayer/HBoxContainer/1").visible = true
	if Global.atrybut1 == true:
		get_node("Camera2D/CanvasLayer/HBoxContainer/2").visible = true
	if Global.atrybut2 == true:
		get_node("Camera2D/CanvasLayer/HBoxContainer/33").visible = true
	if Global.atrybut3 == true:
		get_node("Camera2D/CanvasLayer/HBoxContainer/4").visible = true
		
func _unhandled_input(event): 
	if event.is_action_pressed("LPM"):
		moving = true
		$AudioStreamPlayer.play()
		destination = get_global_mouse_position()

func _physics_process(delta):
	Movement_Loop(delta)
	Animation_player()
	dir_eye = srodek.direction_to(get_global_mouse_position())*1
	srodek = get_node(".").global_position
	get_node("Light2D").global_position = srodek+dir_eye
	if Input.is_action_pressed("esc"):
		get_tree().change_scene("res://Menu/Menu.tscn")


func Movement_Loop(delta): #function to walk hero by click
	if moving == false:       
		speed = 0
		$AudioStreamPlayer.stop()
	else:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	movement = position.direction_to(destination) * speed
	move_direction = rad2deg(destination.angle_to_point(position))
	if position.distance_to(destination) > 5:
		movement = move_and_slide(movement)
	else:
		moving = false
		$AudioStreamPlayer.stop()

func Animation_player():  #function for setting the appropriate animation of the player
	if move_direction <= 15 and move_direction >= -15:
		anim_direction = "E"
	elif move_direction <= 60 and move_direction >= 15:
		anim_direction = "SE"
	elif move_direction <= 120 and move_direction >= 60:
		anim_direction = "S"
	elif move_direction <= 165 and move_direction >= 120:
		anim_direction = "SW"
	elif move_direction >= -60 and move_direction <= -15:
		anim_direction = "NE" 
	elif move_direction >= -120 and move_direction <= -60:
		anim_direction = "N"
	elif move_direction >= -165 and move_direction <= -120:
		anim_direction = "NW"
	elif move_direction <= -165 or move_direction >= 165:
		anim_direction = "W"
		
	if moving == true:
		anim_mode = "walk"
	else: 
		anim_mode = "idle"
	
	animation = anim_mode + "_" + anim_direction
	
	$AnimatedSprite.play(animation)


func stop_player():
	moving = false

func play_dark():
	$AnimationPlayer.play("black")
	
func za_daleko():
	think_panel(daleko)

func think_panel(thinks:Array):
	think_panel = false
	if think_panel == false:
		think = 0
		thinks_from = thinks
		get_node("Camera2D/CanvasLayer/Think").visible = true
	think_panel = true
	get_node("Camera2D/CanvasLayer/Think/Label").text = thinks_from[think]
		
func think_panel_next():
	if Input.is_action_just_pressed("PPM") and think_panel == true:
		if think+1 >= thinks_from.size():
			get_node("Camera2D/CanvasLayer/Think").visible = false
			think_panel = false
		else:
			think +=1
			get_node("Camera2D/CanvasLayer/Think/Label").text = thinks_from[think]

func zoom_camera_animation():
	$AnimationPlayer.play("zoom")		

func zoom_to_monster():
	yield(get_tree().create_timer(1),"timeout")
	var tween = get_node("Tween")
	tween.interpolate_property($Camera2D, "position", Vector2(0, 0), potwor_position.global_position + Vector2(20,-90), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func zoom_to_monster_back():
	var tween = get_node("Tween")
	tween.interpolate_property($Camera2D, "position", Vector2(0,0), Vector2(0,0), 2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
		

   
		
		
