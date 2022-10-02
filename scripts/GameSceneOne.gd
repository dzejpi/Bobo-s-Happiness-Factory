extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if GlobalVar.unload_scene:
		GlobalVar.unload_scene = false
		get_tree().reload_current_scene()
