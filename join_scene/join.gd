extends Node2D


# Declare member variables here. Examples:
# var a = 2
export var input1_path: NodePath
onready var input1 = get_node(input1_path)

export var input2_path: NodePath
onready var input2 = get_node(input2_path)

var set_input1_next = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func draw_pipe(node, pipe_path):
	if node != null:
		var pipe = get_node(pipe_path)
		pipe.visible = true
		pipe.points[0] = node.global_position - global_position
		#print(pipe.points)
		
func join_inputs():
	if input1 != null and input2 != null:
		if (input1.material_name == "Wood" and input2.material_name == "Gem") or\
			(input1.material_name == "Gem" and input2.material_name == "Wood"):
			get_node("MaterialNode").material_name = "Staff"
			var wood_count = input1.count if input1.material_name == "Wood" else input2.count
			var gem_count = input2.count if input1.material_name == "Wood" else input1.count
			get_node("MaterialNode").count = min(wood_count, int(gem_count / 2))
	
func on_path_create(origin_node):
	if input1 == null:
		input1 = origin_node
	elif input2 == null:
		input2 = origin_node
	elif set_input1_next:
		set_input1_next = false
		input1 = origin_node
	else:
		set_input1_next = true
		input2 = origin_node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	draw_pipe(input1, "input1_pipe")
	draw_pipe(input2, "input2_pipe")
	
	join_inputs()
