extends Sprite2D

var velocity := Vector2(480, -480)
var max_speed := normal_speed 


func _process(delta: float)-> void:
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
		
	var boost_speed := 1500.0
	if Input.is_action_just_pressed("boost"):
	max_speed = boost_speed
	get_node("Timer").start()
	velocity = direction * max_speed
	position += velocity * delta
	
	if direction.length() > 0.0:
		rotation = velocity.angle()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
