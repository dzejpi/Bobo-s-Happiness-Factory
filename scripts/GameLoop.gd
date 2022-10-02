extends Node


var elapsed_time = 0
var game_loop_speed = 1


func _ready():
	# Reset everything
	GlobalVar.game_time_elapsed = 0
	GlobalVar.gifts_wrapped = 0
	GlobalVar.gifts_wrapped_price = 0
	GlobalVar.damages_taken = 0
	GlobalVar.game_over = false
	GlobalVar.game_paused = false
	GlobalVar.is_free_to_pick_item = true
	GlobalVar.game_dialog = ""
	GlobalVar.game_speed = 1
	GlobalVar.game_time_elapsed = 0
	GlobalVar.is_gift_being_wrapped = false
	
	# To make double sure
	GlobalVar.is_1_working = true
	GlobalVar.is_2_working = false
	GlobalVar.is_3_working = false
	GlobalVar.is_4_working = false
	GlobalVar.is_5_working = false
	GlobalVar.is_6_working = false


func _process(delta):
	
	match int(elapsed_time):
		0:
			GlobalVar.game_dialog = "Welcome! We need some wine bottles packaged."
			GlobalVar.game_dialog_countdown = 8
		10:
			GlobalVar.game_dialog = "Wait for it!"
			GlobalVar.game_dialog_countdown = 2
		14:
			GlobalVar.game_dialog = "Click on it and wrap it by clicking on +."
			GlobalVar.game_dialog_countdown = 4
		20:
			GlobalVar.game_dialog = "Great job! Management wishes you a very successfull shift!"
			GlobalVar.game_dialog_countdown = 10
		35:
			GlobalVar.game_dialog = "Romantic night with nine needs some candles."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.is_2_working = true
		50:
			GlobalVar.game_dialog = "Life is like a box of chocolates."
			GlobalVar.game_dialog_countdown = 5
			GlobalVar.is_3_working = true
		55:
			GlobalVar.game_dialog = "A cheap, thoughtless, gift that nobody ever asks for."
			GlobalVar.game_dialog_countdown = 5
		70:
			GlobalVar.game_dialog = "We have enough wine. We need jam and tea now."
			GlobalVar.game_dialog_countdown = 5
			GlobalVar.is_4_working = true
			GlobalVar.is_6_working = true
			GlobalVar.is_1_working = false
		90:
			GlobalVar.game_dialog = "Super sorry! We forgot about the soap."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.is_5_working = true
		120:
			GlobalVar.game_dialog = "You seem super busy. We should slow down."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 0.80
		140:
			GlobalVar.game_dialog = "We should slow even more."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 0.50
		154:
			GlobalVar.game_dialog = "We need to package wine now too."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 0.50
			GlobalVar.is_1_working = true
		170:
			GlobalVar.game_dialog = "We need to speed up."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 0.80
		190:
			GlobalVar.game_dialog = "Normal speed now!"
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 1
		220:
			GlobalVar.game_dialog = "Good news! No need for soap anymore."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 1
			GlobalVar.is_5_working = false
		260:
			GlobalVar.game_dialog = "Nevermind, customers changed their mind."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 1
		300:
			GlobalVar.game_dialog = "What is happening? Spacetime seems to be warping up."
			GlobalVar.game_dialog_countdown = 10
			GlobalVar.game_speed = 2

	elapsed_time += (game_loop_speed * delta)
