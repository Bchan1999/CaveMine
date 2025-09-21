extends Node2D
class_name TileMapController

@export var tilemap : TileMapLayer
@export var player : CharacterBody2D

var MAIN_SOURCE = 1
var SELECT_TILE = Vector2i(4,2)

var previousCell = Vector2i(4,2)

var used_cells : Array[Vector2i]

var clickable 
var clickable_pos = []

func _ready() -> void:
	used_cells = tilemap.get_used_cells()
	
func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()
	var local_pos = tilemap.to_local(camera.get_global_mouse_position())
	var mouse_pos = tilemap.local_to_map(local_pos)
	
	#print(clickable_pos)
	if clickable:
		for x in clickable:
			if (mouse_pos == x):
				if (previousCell == mouse_pos):
					tilemap.set_cell(previousCell, MAIN_SOURCE, SELECT_TILE)
				else:
					tilemap.set_cell(mouse_pos, MAIN_SOURCE, SELECT_TILE)
					tilemap.erase_cell(previousCell)
					previousCell = mouse_pos		
		
		#print(clickable)
		#print(player_pos)
		#print("neighbor right" , tilemap.get_neighbor_cell(player_pos, TileSet.CELL_NEIGHBOR_RIGHT_SIDE))
		#clickable =  tilemap.get_neighbor_cell(player_pos, TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	
	#print(clicked_cell)	

func _on_player_moved_pos() -> void:
	clickable_pos = []
	var player_pos = tilemap.to_local(player.global_position)
	var player_pos_map = tilemap.local_to_map(player_pos)
	clickable = tilemap.get_surrounding_cells(player_pos_map)
	print(clickable)
	for item in clickable:
		clickable_pos.append(tilemap.local_to_map(item))
