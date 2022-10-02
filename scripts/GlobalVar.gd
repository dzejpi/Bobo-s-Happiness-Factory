extends Node


onready var sfx_node = $SfxPlayer
onready var music_node = $MusicPlayer

var gifts_wrapped = 0
var gifts_wrapped_price = 0
var damages_taken = 0
var game_over = false
var game_paused = false
var is_free_to_pick_item = true
var game_dialog = ""
var game_dialog_countdown = 10
var game_speed = 1
var game_time_elapsed = 0

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

var sfx_glass_fall = preload("res://assets/sfx/sfx_glass_fall.wav")
var sfx_glass_fall_two = preload("res://assets/sfx/sfx_glass_fall_two.wav")
var sfx_hard_fall = preload("res://assets/sfx/sfx_hard_fall.wav")
var sfx_hard_fall_two = preload("res://assets/sfx/sfx_hard_fall_two.wav")
var sfx_select = preload("res://assets/sfx/sfx_select.wav")
var sfx_soft_fall = preload("res://assets/sfx/sfx_soft_fall.wav")
var sfx_soft_fall_two = preload("res://assets/sfx/sfx_soft_fall_two.wav")
var sfx_wrap = preload("res://assets/sfx/sfx_wrap.wav")

#var game_music = preload("")


func _ready():
	pass


func _process(delta):
	if damages_taken > 500:
		game_over = true
	
	game_time_elapsed += (1 * delta)
	
	if game_dialog_countdown > 0:
		game_dialog_countdown -= (1 * delta)
	else:
		game_dialog = ""
		game_dialog_countdown = 0

#func play_music(number):
#	music_node.play(game_music)
	
	
func play_sound(sfx):
	match sfx:
		"sfx_glass_fall":
			sfx_node.stream = sfx_glass_fall
			sfx_node.play()
		"sfx_glass_fall_two":
			sfx_node.stream = sfx_glass_fall_two
			sfx_node.play()
		"sfx_hard_fall":
			sfx_node.stream = sfx_hard_fall
			sfx_node.play()
		"sfx_hard_fall_two":
			sfx_node.stream = sfx_hard_fall_two
			sfx_node.play()
		"sfx_select":
			sfx_node.stream = sfx_select
			sfx_node.play()
		"sfx_soft_fall":
			sfx_node.stream = sfx_soft_fall
			sfx_node.play()
		"sfx_soft_fall_two":
			sfx_node.stream = sfx_soft_fall_two
			sfx_node.play()
		"sfx_wrap":
			sfx_node.stream = sfx_wrap
			sfx_node.play()
