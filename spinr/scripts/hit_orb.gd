extends Area2D

func _on_collision(body: Node2D):
	if body.is_in_group("orb"):
		global.hit_orbs += 1.0
		body.get_parent().queue_free()
