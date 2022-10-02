extends Node2D


export var type = 1
export var delay = 0
export var generator_working = true

onready var item_1 = load("res://scenes/items/BottleScene.tscn")
onready var item_2 = load("res://scenes/items/CandleScene.tscn")
onready var item_3 = load("res://scenes/items/ChocolateScene.tscn")
onready var item_4 = load("res://scenes/items/JamScene.tscn")
onready var item_5 = load("res://scenes/items/SoapScene.tscn")
onready var item_6 = load("res://scenes/items/TeaScene.tscn")

var generator_countdown = 10

onready var label = get_node("Label")


func _ready():
	match type:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass


func _process(delta):
	if generator_working:
		if delay >= 0:
			delay -= (1 * delta)
		else:
			if generator_countdown >= 0:
				generator_countdown -= (1 * delta)
			else:
				generator_countdown = 11
				generate_proper_item(type)
	else:
		generator_countdown = 0
	
	label.text = String(int(generator_countdown))
	

func generate_proper_item(type):
	match type:
		1:
			var item_1_instance = item_1.instance()
			get_tree().root.add_child(item_1_instance)
		2:
			var item_2_instance = item_2.instance()
			get_tree().root.add_child(item_2_instance)
		3:
			var item_3_instance = item_3.instance()
			get_tree().root.add_child(item_3_instance)
		4:
			var item_4_instance = item_4.instance()
			get_tree().root.add_child(item_4_instance)
		5:
			var item_5_instance = item_5.instance()
			get_tree().root.add_child(item_5_instance)
		6:
			var item_6_instance = item_6.instance()
			get_tree().root.add_child(item_6_instance)
