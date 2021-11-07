extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var count = 0
export var material_name = ''

const material_properties = {
	"Wood": {
		"texture": preload("res://.import/tile_0089.png-af2f32e725fb029a701b00d8aec7ec20.stex")
	},
	"Gem": {
		"texture": preload("res://.import/tile_0067.png-76a5a387b5cfb7bfde5f3df29dca7f54.stex")
	},
	"Staff": {
		"texture": preload("res://.import/tile_0069.png-8245265e636421897d00d6d881ac538a.stex")
	},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var material = get_node("material")
	if material != null and material_name != '':
		material.texture = material_properties[material_name]['texture']
		
	var name = get_node("name")
	if name != null:
		name.text = '{name} {count}'.format({
		'name': material_name, 'count': count
		})
