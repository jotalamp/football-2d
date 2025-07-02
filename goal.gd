extends StaticBody2D

var goal_counted = false
@export var home_team = true

func _on_goal_area_body_entered(body: Node2D) -> void:
	if not goal_counted and body.is_in_group("ball"):
		$"%Scoreboard".scored(home_team)
		goal_counted = true
