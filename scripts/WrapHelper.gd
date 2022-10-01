extends Node2D

func _ready():
	visible = false


func _process(delta):
	if GlobalVar.is_gift_being_wrapped:
		visible = true
		self.position.x = GlobalVar.wrapped_item_x
		self.position.y = GlobalVar.wrapped_item_y
		self.position = self.position + GlobalVar.wrapping_guide_points[(GlobalVar.actual_wrapping_point - 1)]
	else:
		visible = false
		
	if GlobalVar.actual_wrapping_point >= 5:
		visible = false
		
	# Extra check
	if visible == false:
		self.position = Vector2(-20, -20)


func _on_Area2D_mouse_entered():
	if GlobalVar.is_gift_being_wrapped:
		if GlobalVar.actual_wrapping_point < 5:
			GlobalVar.actual_wrapping_point += 1
			self.position.x = GlobalVar.wrapped_item_x
			self.position.y = GlobalVar.wrapped_item_y
			self.position = self.position + GlobalVar.wrapping_guide_points[(GlobalVar.actual_wrapping_point - 1)]
		else:
			visible = false
