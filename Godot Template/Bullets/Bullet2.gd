extends KinematicBody2D

var speed = 2.5
var velocity = Vector2.ZERO
var enemies = []

func _ready():
	pass

func _physics_process(_delta):
	position += velocity 
	position.y -= speed
	if position.y < -20:
		queue_free()



func _on_Detonation_timeout():
	for e in enemies:
		e.die(10)
	queue_free()


func _on_Area2D_body_entered(body):
	enemies.append(body)


func _on_Area2D_body_exited(body):
	for e in enemies:
		if body.name == e.name:
			enemies.erase(e)
