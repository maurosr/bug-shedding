tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("MaterialNode", "Node2D", preload("res://addons/material_node/GameMaterial.gd"), null)


func _exit_tree():
	remove_custom_type("MaterialNode")
