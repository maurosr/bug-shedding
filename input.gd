extends Node2D


# Declare member variables here. Examples:
export var count = 0
export var material_name = ''


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("name").text = '{name} {count}'.format({
		'name': material_name, 'count': count
		})
