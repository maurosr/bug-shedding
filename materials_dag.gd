tool
extends EditorScript

func load_materials_dag(filename="res://assets/minecraft_recipes.csv"):
	var materials_dag = {}
	var file = File.new()

	file.open(filename, File.READ)
	while !file.eof_reached():
		var csv = file.get_csv_line()
		if !(csv[0] in materials_dag):
			materials_dag[csv[0]] = {}
		materials_dag[csv[0]][csv[2]] = csv[1]
		
	return materials_dag
	
func _run():
	print(load_materials_dag())
