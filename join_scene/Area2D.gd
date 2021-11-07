extends Area2D


# Declare member variables here. Examples:
# var a = 2
var dragged = true
	
func _input_event(viewport, event, shape_idx):
	#if event is 
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			dragged = event.pressed
			
			if event.pressed:
				var selected = get_node("/root/main").selected
				if selected != null:
					get_parent().on_path_create(selected)
					get_node("/root/main").selected = null

		elif event.button_index == BUTTON_RIGHT:
			get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragged:
		get_parent().position = get_global_mouse_position()
	
