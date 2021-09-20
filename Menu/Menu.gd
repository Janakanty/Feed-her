extends Control



func _ready():
	$AudioStreamPlayer.play()



func _on_Button_pressed():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer2.play()
	$VBoxContainer.visible = false
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://Rooms/realy_monster_room/pokoj_potwor.tscn")


func _on_Button2_pressed():
	get_tree().quit()
