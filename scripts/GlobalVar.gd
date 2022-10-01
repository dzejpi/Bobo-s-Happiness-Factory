extends Node


var gifts_wrapped = 0
var damages_taken = 0
var game_over = false
var is_free_to_pick_item = true

var is_gift_being_wrapped = false
var actual_wrapping_point = 0
var wrapping_guide_points = [Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0)]

var wrapped_item_x = 0
var wrapped_item_y = 0

func _ready():
	pass


func _process(delta):
	pass
