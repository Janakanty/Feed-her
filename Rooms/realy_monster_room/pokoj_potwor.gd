extends Node2D

onready var player = get_node("/root/Map/YSort/Player")
onready var potwor = get_node("/root/Map/YSort/potwor")
onready var player_pom = get_node("/root/Map/YSort/Player/Camera2D/CanvasLayer/ColorRect")


# Called when the node enters the scene tree for the first time.
func _ready():
	$dymek.visible = false
	$acceptpaperdoc.visible = false
	$hajs.visible = false
	$bloodpN.visible = false
	playmusic()
	if Global.pierwszy_potwor == false:
		Global.pierwszy_potwor = true
		player.zoom_to_monster()
		$dymek.visible = true
		$bloodpN.visible = true
		$AnimationPlayer.play("start")
		yield(get_tree().create_timer(7),"timeout")
		$dymek.visible = false
		$bloodpN.visible = false
		$AnimationPlayer.stop()
		player.zoom_to_monster_back()
		
		
	
func playmusic():
	yield(get_tree().create_timer(1),"timeout")
	$AudioStreamPlayer.play()
	
func animation1():
	player.zoom_to_monster()
	$AudioStreamPlayer2.play()
	yield( get_node("AudioStreamPlayer2"), "finished" )
	$AnimationPlayer.play("1")
	yield( get_node("AnimationPlayer"), "animation_finished" )
	player.zoom_to_monster_back()
	
func animation2():
	player.zoom_to_monster()
	$AudioStreamPlayer3.play()
	yield( get_node("AudioStreamPlayer3"), "finished" )
	$AnimationPlayer.play("2")
	yield( get_node("AnimationPlayer"), "animation_finished" )
	player.zoom_to_monster_back()
	
func animation3():
	player.zoom_to_monster()
	$AudioStreamPlayer4.play()
	yield( get_node("AudioStreamPlayer4"), "finished" )
	player_pom.visible = true
	yield(get_tree().create_timer(5),"timeout")
	player_pom.visible = false
	potwor.wraw_die()
	
	
	
func die():
	$AnimationPlayer.play("3")
	yield( get_node("AnimationPlayer"), "animation_finished" )
	

func change():
	get_tree().change_scene("res://Menu/Menu.tscn")
