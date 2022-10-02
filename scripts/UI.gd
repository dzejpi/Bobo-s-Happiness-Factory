extends Node


onready var gifts_wrapped = get_node("GiftsNumberLabel")
onready var gifts_destroyed = get_node("GiftsDestroyedLabel")


func _ready():
	pass # Replace with function body.


func _process(delta):
	gifts_wrapped.text = "Gifts wrapped: " + String(GlobalVar.gifts_wrapped) + " / " + String(GlobalVar.gifts_wrapped_price) + " $"
	gifts_destroyed.text = String(GlobalVar.damages_taken) + "$ damaged"
