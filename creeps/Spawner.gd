extends Position3D

export (PackedScene) var mob_scene = null


func _ready() -> void:
	if mob_scene:
		var creep : Spatial = mob_scene.instance()
		add_child(creep)
	
