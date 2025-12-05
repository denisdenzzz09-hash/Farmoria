extends TileMapLayer

@onready var overlay := $tile_overlay
@onready var dirt_layer := $dirt

func _ready():
	$tile_overlay.visible = true


func _input(event):

	if event is InputEventMouseMotion:
		var snapped_position = snapped(get_global_mouse_position(), Vector2(12, 12))
		overlay.set_deferred("position", snapped_position)

	if event is InputEventMouseButton and event.is_pressed():
		var _coords = local_to_map(get_global_mouse_position())
		var _data = get_cell_tile_data(_coords)

		if _data != null:	
			# place dirt tile
			dirt_layer.set_cells_terrain_connect([_coords], 1, 1)
			pass

		
