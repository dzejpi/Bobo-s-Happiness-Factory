extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass


func _process(delta):
	pass


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/MainMenuScene.tscn")
