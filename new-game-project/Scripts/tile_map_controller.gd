extends Node2D
class_name TileMapController

@export var tilemap : TileMapLayer
@export var spawn : Marker2D

func _ready() -> void:
	var spawn_local = tilemap.to_local(spawn.global_position)
	print(spawn_local)
	
	print(spawn_local)
	


func get_path_options(location : Vector2) -> Dictionary:
	
	return {}
	
