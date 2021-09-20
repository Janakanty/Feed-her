extends Control

onready var number = $ColorRect/VBoxContainer/ColorRect/Label
var actual_string = ""
onready var pom = get_node("/root/Map/YSort/Blood")

func _ready():
	pass # Replace with function body.

func check_number():
	if actual_string.length()==10:
		if actual_string == "2222543432":
			$good.play()
			pom.visible = true
			Global.drzwi_w_lv_1 = true
		else:
			$bad.play()
		actual_string = ""
		number.text = ""

func _on_Button_pressed():
	$AudioStreamPlayer.play()
	number.text = number.text + "1"
	actual_string = actual_string + "1"
	check_number()


func _on_Button2_pressed():
	$AudioStreamPlayer2.play()
	number.text = number.text + "2"
	actual_string = actual_string + "2"
	check_number()


func _on_Button3_pressed():
	$AudioStreamPlayer3.play()
	number.text = number.text + "3"
	actual_string = actual_string + "3"
	check_number()


func _on_Button4_pressed():
	$AudioStreamPlayer4.play()
	number.text = number.text + "4"
	actual_string = actual_string + "4"
	check_number()


func _on_Button5_pressed():
	$AudioStreamPlayer5.play()
	number.text = number.text + "5"
	actual_string = actual_string + "5"
	check_number()
	

func _on_Button6_pressed():
	$AudioStreamPlayer6.play()
	number.text = number.text + "6"
	actual_string = actual_string + "6"
	check_number()


func _on_Button7_pressed():
	$AudioStreamPlayer7.play()
	number.text = number.text + "7"
	actual_string = actual_string + "7"
	check_number()


func _on_Button8_pressed():
	$AudioStreamPlayer8.play()
	number.text = number.text + "8"
	actual_string = actual_string + "8"
	check_number()


func _on_Button9_pressed():
	$AudioStreamPlayer9.play()
	number.text = number.text + "9"
	actual_string = actual_string + "9"
	check_number()

func _on_Buttonn_pressed():
	queue_free()
