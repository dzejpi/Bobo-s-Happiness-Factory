extends Node


var gifts_wrapped = 0
var gifts_wrapped_price = 0
var damages_taken = 0
var game_over = false
var is_free_to_pick_item = true
var game_dialog = ""
var game_dialog_countdown = 10
var game_speed = 1

var is_gift_being_wrapped = false
var actual_wrapping_point = 0
var wrapping_guide_points = [Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0)]

var wrapped_item_x = 0
var wrapped_item_y = 0

var is_1_working = true
var is_2_working = false
var is_3_working = false
var is_4_working = false
var is_5_working = false
var is_6_working = false


func _ready():
	pass


func _process(delta):
	if game_dialog_countdown > 0:
		game_dialog_countdown -= (1 * delta)
	else:
		game_dialog = ""
		game_dialog_countdown = 0
