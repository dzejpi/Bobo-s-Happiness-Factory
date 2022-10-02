extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass


func _process(delta):
	pass


func _on_MainMenuButton_pressed():
	GlobalVar.play_sound("sfx_select")
	GlobalVar.unload_scene = true
	get_tree().change_scene("res://scenes/MainMenuScene.tscn")
