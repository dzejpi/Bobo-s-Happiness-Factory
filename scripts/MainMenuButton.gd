extends TextureButton


# var a = 2


func _ready():
	pass


func _process(delta):
	pass


func _on_MainMenuButton_pressed():
	GlobalVar.play_sound("select")
	get_tree().change_scene("res://scenes/MainMenuScene.tscn")
	
