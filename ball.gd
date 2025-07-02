extends RigidBody2D

var teleporting = false
var teleported_pos = Vector2(480,0)

func _on_timer_timeout():
	teleporting = true
	$"%GoalA".goal_counted = false
	$"%GoalB".goal_counted = false

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		teleporting = true;
		
func _on_goal_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		$"Timer".start()

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if position.y > 10:
		teleporting = true
	
	if teleporting:
		var new_transform = state.get_transform()
		new_transform.origin = teleported_pos
		state.set_transform(new_transform)

		# Reset velocities to avoid the object going through walls
		state.set_linear_velocity(Vector2())
		state.set_angular_velocity(0.0)
	
		teleporting = false
