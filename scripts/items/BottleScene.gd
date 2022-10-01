extends Node2D


onready var bottle_sprite = get_node("BottleSprite")
onready var wrap_sprite = get_node("WrapSprite")

var bottle_sprite_1 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_1.png")
var bottle_sprite_2 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_2.png")
var bottle_sprite_3 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_3.png")
var bottle_sprite_4 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_4.png")
var bottle_sprite_5 = preload("res://assets/visual/game_assets/bottle/spr_item_bottle_5.png")

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
var is_wrapped = false

var is_selected = false
var wrapped_points = 0

var price_value = 20


# Called when the node enters the scene tree for the first time.
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
		self.position.x += (8 * delta)
	
	# Clicking
	if is_on_working_area:
		pass


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
		
