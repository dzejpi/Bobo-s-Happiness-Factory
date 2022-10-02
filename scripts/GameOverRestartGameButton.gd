extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass


func _process(delta):
	pass


func _on_RestartGameButton_pressed():
	get_tree().reload_current_scene()
