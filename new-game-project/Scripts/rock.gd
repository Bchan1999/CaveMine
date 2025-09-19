extends Node2D

var MAX_HEALTH = 10
var health
@export var anim : AnimationPlayer

func _ready() -> void:
	health = MAX_HEALTH

func give_me_dmg(dmg: int):
	health = health - dmg
	#health = clamp(health, 0, MAX_HEALTH)
	print(health)
	if health == 0:
		anim.play("break")
		self.queue_free()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("mine")):
		print("test")
		give_me_dmg(5)
	pass # Replace with function body.
