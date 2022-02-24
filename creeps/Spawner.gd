extends Position3D

export (PackedScene) var mob_scene = null

onready var parent : Spatial = get_parent()
onready var facing : Vector3 = $Facing.to_global($Facing.cast_to) - $Facing.to_global(Vector3.ZERO)

func _ready() -> void:
	if mob_scene:
		var creep : Spatial = mob_scene.instance()
		creep.transform = transform
		creep.set_velocity(facing)
		parent.call_deferred("add_child", creep)
	
