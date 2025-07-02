extends RigidBody2D

const ground_y_position = -70
var teleporting = false
const jump_impulse = 40000.0;
const move_impulse = 40.0;
var teleported_pos = Vector2(300,0)
@export var player_id = 0

func _physics_process(_delta):
	var y_position = self.transform.get_origin().y
	var on_ground = y_position > ground_y_position

	var pin:PinJoint2D = get_node("%LegJoint")
	var pin2:PinJoint2D = get_node("%LegJoint2")
	
	var btn_left = "p1_left";
	var btn_right = "p1_right";
	var _btn_up = "p1_up"
	var _btn_down = "p1_down"
	var btn_kick1 = "p1_kick1"
	var btn_kick2 = "p1_kick2"
	var btn_jump = "p1_up"
	var inv = 1
	
	if player_id == 2: 
		pin = get_node("%Leg2Joint")
		pin2 = get_node("%Leg2Joint2")
		btn_left = "ui_left";
		btn_right = "ui_right";
		btn_kick1 = "p2_kick1"
		btn_kick2 = "p2_kick2"
		btn_jump = "ui_up"
		inv = -1
		
	var up_vector = global_transform.y
	
	if on_ground:
		if Input.is_action_pressed(btn_left):
			apply_central_impulse(Vector2(-move_impulse,0.0))
			apply_torque_impulse(-50)
		
		if Input.is_action_pressed(btn_right):
			apply_torque_impulse(50)
			apply_central_impulse(Vector2(move_impulse,0.0))
			
		if Input.is_action_just_pressed(btn_jump):
			apply_central_impulse(-jump_impulse*up_vector)
		
	if Input.is_action_pressed(btn_kick1):
		pin.motor_target_velocity = -10*inv;
		apply_torque_impulse(-200)
	else:
		pin.motor_target_velocity = 10*inv;
		
	if Input.is_action_pressed(btn_kick2):
		pin2.motor_target_velocity = 20*inv;
		apply_torque_impulse(200)
	else:
		pin2.motor_target_velocity = -10*inv;
