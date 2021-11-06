extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var join_scene = preload("res://join.tscn")


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var node = join_scene.instance()
		node.position = event.position
		get_node('/root/main').add_child(node)

func _process(delta):
	pass
