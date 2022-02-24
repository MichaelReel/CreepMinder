extends Area

var opponent : Spatial = null

onready var team_name : String


func can_see_opponent() -> bool:
	return opponent != null


func _on_OpponentDetectionZone_body_entered(body : Spatial) -> void:
	if opponent:
		return
	if not body.has_method("get_team"):
		return
	if team_name == body.get_team():
		return
	print("body from team " + body.get_team() + " has entered area for team " + team_name)
	opponent = body


func _on_OpponentDetectionZone_body_exited(body : Spatial) -> void:
	if opponent != body:
		return
	print("body from team " + body.get_team() + " has exited area for team " + team_name)
	opponent = null
