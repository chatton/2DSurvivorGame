extends Node

@export var sword_ability: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout():
	var player: Node2D = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	var sword: Node2D = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword)
	sword.global_position = player.tranglobal_positionsform
