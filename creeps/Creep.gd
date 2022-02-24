extends KinematicBody

var velocity := Vector3.FORWARD
export var team_name : String


func _ready():
	$OpponentDetectionZone.team_name = team_name


func _process(_delta):
	_apply_velocity()


func get_team() -> String:
	return team_name


func set_velocity(new_velocity : Vector3) -> void:
	velocity = new_velocity


func _apply_velocity() -> void:
	var facing := global_transform.origin + Vector3(velocity.x, 0, velocity.z)
	if facing != global_transform.origin:
		look_at(facing, Vector3.UP)
	velocity = move_and_slide(velocity, Vector3.UP)
