extends Node2D


onready var seconds_label = get_node("TextLabels/SecondsLabel")
onready var gifts_wrapped = get_node("TextLabels/GiftsWrappedLabel")
onready var gifts_destroyed = get_node("TextLabels/GiftsDestroyedLabel")

var game_over_displayed = false
var seconds_elapsed = 0
var gifts_wrapped_amount = 0
var gifts_wrapped_worth = 0
var gifts_destroyed_value = 0

func _ready():
	pass


func _process(delta):
	if GlobalVar.game_over:
		if !game_over_displayed:
			game_over_displayed = true
			visible = true
			seconds_elapsed = GlobalVar.game_time_elapsed
			gifts_wrapped_amount = GlobalVar.gifts_wrapped
			gifts_wrapped_worth = GlobalVar.gifts_wrapped_price
			gifts_destroyed_value = GlobalVar.damages_taken
		
			seconds_label.text = "It took you only " + String(int(seconds_elapsed)) + " seconds to get fired."
			gifts_wrapped.text = "You wrapped " + String(int(gifts_wrapped_amount)) + " gifts worth " + String(int(gifts_wrapped_worth)) + "$."
			gifts_destroyed.text = "You destroyed gifts worth " + String(int(gifts_destroyed_value)) +"$."
	else:
		visible = false
