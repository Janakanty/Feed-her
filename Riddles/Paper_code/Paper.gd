extends Control

export (Color,RGB) var mouse_out = Color(1,1,1)
export (Color,RGB) var mouse_over = Color(0.7,0.7,0.7)

var odp1 = 0
var odp2 = 0 
var odp3 = 0

func check_answers():
	if odp1 == 1 and odp2 == 2 and odp3 == 3:
		good()
	else:
		bad()
	
func good():
	Global.zagadka_nagloki=true
	#otwierająsiędrzwi
	#notatka zmienia się i jest napis - coś takiego powinno przejść.
	#na środku pojawia się gazeta dla potwora 
	pass
	
func bad():
	#zmienia się notatka "tego ludzie czytać nie będą. Postaraj się bardziej"
	pass

func _ready():
	$ColorRect4.visible = true
	$ColorRect5.visible = false
	$ColorRect6.visible = false
	$AudioStreamPlayer.play()
	

func _on_TextureButton_pressed():
	odp1 = 1
	$ColorRect4.visible = false
	$ColorRect5.visible = true
	$AudioStreamPlayer.play()

func _on_TextureButton2_pressed():
	odp1 = 2
	$ColorRect4.visible = false
	$ColorRect5.visible = true
	$AudioStreamPlayer.play()

func _on_TextureButton3_pressed():
	odp1 = 3
	$ColorRect4.visible = false
	$ColorRect5.visible = true
	$AudioStreamPlayer.play()
	
func _on_TextureButton4_pressed():
	odp2 = 1
	$ColorRect5.visible = false
	$ColorRect6.visible = true
	$AudioStreamPlayer.play()

func _on_TextureButton5_pressed():
	odp2 = 2
	$ColorRect5.visible = false
	$ColorRect6.visible = true
	$AudioStreamPlayer.play()

func _on_TextureButton6_pressed():
	odp2 = 3
	$ColorRect5.visible = false
	$ColorRect6.visible = true
	$AudioStreamPlayer.play()

func _on_TextureButton7_pressed():
	$ColorRect6.visible = false
	$AudioStreamPlayer2.play()
	yield(get_tree().create_timer(1), "timeout")
	queue_free()



func _on_TextureButton8_pressed():
	$ColorRect6.visible = false
	$AudioStreamPlayer2.play()
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
	


func _on_TextureButton9_pressed():
	$ColorRect6.visible = false
	$AudioStreamPlayer2.play()
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
	

#
# ZMIANA KOLORU PO NAJECHANIU NA NAGLOWEK
#

func _on_TextureButton_mouse_entered():
	get_node("ColorRect4/ColorRect").set_modulate(mouse_over)


func _on_TextureButton_mouse_exited():
	get_node("ColorRect4/ColorRect").set_modulate(mouse_out)


func _on_TextureButton2_mouse_entered():
	get_node("ColorRect4/ColorRect2").set_modulate(mouse_over)


func _on_TextureButton2_mouse_exited():
	get_node("ColorRect4/ColorRect2").set_modulate(mouse_out)


func _on_TextureButton3_mouse_entered():
	get_node("ColorRect4/ColorRect3").set_modulate(mouse_over)


func _on_TextureButton3_mouse_exited():
	get_node("ColorRect4/ColorRect3").set_modulate(mouse_out)


func _on_TextureButton4_mouse_entered():
	get_node("ColorRect5/ColorRect").set_modulate(mouse_over)


func _on_TextureButton4_mouse_exited():
	get_node("ColorRect5/ColorRect").set_modulate(mouse_out)


func _on_TextureButton5_mouse_entered():
	get_node("ColorRect5/ColorRect2").set_modulate(mouse_over)


func _on_TextureButton5_mouse_exited():
	get_node("ColorRect5/ColorRect2").set_modulate(mouse_out)


func _on_TextureButton6_mouse_entered():
	get_node("ColorRect5/ColorRect3").set_modulate(mouse_over)


func _on_TextureButton6_mouse_exited():
	get_node("ColorRect5/ColorRect3").set_modulate(mouse_out)


func _on_TextureButton7_mouse_entered():
	get_node("ColorRect6/ColorRect").set_modulate(mouse_over)


func _on_TextureButton7_mouse_exited():
	get_node("ColorRect6/ColorRect").set_modulate(mouse_out)


func _on_TextureButton8_mouse_entered():
	get_node("ColorRect6/ColorRect2").set_modulate(mouse_over)


func _on_TextureButton8_mouse_exited():
	get_node("ColorRect6/ColorRect2").set_modulate(mouse_out)


func _on_TextureButton9_mouse_entered():
	get_node("ColorRect6/ColorRect3").set_modulate(mouse_over)


func _on_TextureButton9_mouse_exited():
	get_node("ColorRect6/ColorRect3").set_modulate(mouse_out)
