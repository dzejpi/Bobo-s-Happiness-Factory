extends Node2D


onready var bottle_sprite = get_node("BottleSprite")
onready var wrap_sprite = get_node("WrapSprite")

var bottle_sprite_1 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_1.png")
var bottle_sprite_2 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_2.png")
var bottle_sprite_3 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_3.png")
var bottle_sprite_4 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_4.png")
var bottle_sprite_5 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_5.png")

var bottle_wrap_sprite_1 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_wrap_1.png")
var bottle_wrap_sprite_2 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_wrap_2.png")
var bottle_wrap_sprite_3 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_wrap_3.png")
var bottle_wrap_sprite_4 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_wrap_4.png")
var bottle_wrap_sprite_5 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_wrap_5.png")

var wrap_guide_1 = Vector2(14, 13)
var wrap_guide_2 = Vector2(2, 5)
var wrap_guide_3 = Vector2(13, 4)
var wrap_guide_4 = Vector2(8, 0)
var wrap_guide_5 = Vector2(8, 15)

var sprite_set = 0

var initial_x = 0
var initial_y = 84

var working_area_y = 0
var working_area_x_begin = 82
var working_area_x_end = 178

var is_on_conveyor = true
var is_on_working_area = false
var is_fallen = false
var is_being_wrapped = false

var is_selected = false
var wrapped_points = 0
var is_wrapped_up = true

var price_value = 20

var is_mouse_in = false


func _ready():
	set_random_sprite()
	self.position.x = initial_x
	self.position.y = initial_y


func _process(delta):
	if self.position.x > working_area_x_end:
		is_on_conveyor = false
		is_on_working_area = false
		if !is_fallen:
			GlobalVar.damages_taken += price_value
			is_fallen = true
		
	elif self.position.x > working_area_x_begin:
		is_on_conveyor = false
		is_on_working_area = true
	else:
		is_on_conveyor = true
		is_on_working_area = false
	
	if is_on_conveyor:
		self.position.x += (12 * delta)
	if is_on_working_area:
		if !is_being_wrapped:
			self.position.x += (8 * delta)
		
	# Handling the clicking
	if Input.is_action_pressed("mouse_button_left") and is_mouse_in == true:
		if is_on_working_area && GlobalVar.is_free_to_pick_item:
			if !is_being_wrapped:
				GlobalVar.is_gift_being_wrapped = true
				GlobalVar.wrapping_guide_points = [
					wrap_guide_1, 
					wrap_guide_2, 
					wrap_guide_3, 
					wrap_guide_4, 
					wrap_guide_5
					]
				is_being_wrapped = true
				
				
	if is_being_wrapped:
		if bottle_sprite.scale.x < 2:
			bottle_sprite.scale.x += 0.1
		if bottle_sprite.scale.y < 2:
			bottle_sprite.scale.y += 0.1
				
		if self.position.y > 44:
			self.position.y -= 2
			
		set_wrap_sprite(GlobalVar.actual_wrapping_point)
		
		
	if GlobalVar.actual_wrapping_point == 5:
		if !is_wrapped_up:
			is_wrapped_up = true
			is_being_wrapped = false
			GlobalVar.gifts_wrapped += 1
			GlobalVar.is_free_to_pick_item = true
			
	if is_wrapped_up:
		if modulate.a > 0:
			modulate.a -= 0.01
		else:
			queue_free()

func set_wrap_sprite(wrapping_point):
	match wrapping_point:
		1:
			wrap_sprite.texture = bottle_wrap_sprite_1
		2:
			wrap_sprite.texture = bottle_wrap_sprite_2
		3:
			wrap_sprite.texture = bottle_wrap_sprite_3
		4:
			wrap_sprite.texture = bottle_wrap_sprite_4
		5:
			wrap_sprite.texture = bottle_wrap_sprite_5


func set_random_sprite():
	var sprite_number = randi() % (5 - 1) + 1
	
	match sprite_number:
		1: 
			bottle_sprite.texture = bottle_sprite_1
		2: 
			bottle_sprite.texture = bottle_sprite_2
		3: 
			bottle_sprite.texture = bottle_sprite_3
		4: 
			bottle_sprite.texture = bottle_sprite_4
		5: 
			bottle_sprite.texture = bottle_sprite_5
		


func _on_BottleArea2D_mouse_entered():
	is_mouse_in = true


func _on_BottleArea2D_mouse_exited():
	is_mouse_in = false