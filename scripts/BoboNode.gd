extends Node2D


onready var bobo_sprite = get_node("BoboSprite")

var bobo_sprite_1 = preload("res://assets/visual/game_assets/bobo/spr_bobo_one.png")
var bobo_sprite_2 = preload("res://assets/visual/game_assets/bobo/spr_bobo_two.png")
var bobo_sprite_3 = preload("res://assets/visual/game_assets/bobo/spr_bobo_three.png")
var bobo_sprite_4 = preload("res://assets/visual/game_assets/bobo/spr_bobo_four.png")

var bobo_mood = GlobalVar.bobo_mood
var is_bobo_going_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	if is_bobo_going_right:
		if self.global_position.x < 20:
			self.position.x += 0.10
		else:
			is_bobo_going_right = false
	else:
		if self.global_position.x > -20:
			self.position.x -= 0.10
		else:
			is_bobo_going_right = true
	
	bobo_mood = GlobalVar.bobo_mood
	
	match bobo_mood:
		1:
			bobo_sprite.texture = bobo_sprite_1
		2:
			bobo_sprite.texture = bobo_sprite_2
		3:
			bobo_sprite.texture = bobo_sprite_3
		4:
			bobo_sprite.texture = bobo_sprite_4
