extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# make this camera the current one.
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target: Vector2 = acquire_target()
	global_position = global_position.lerp(target, 1.0 - exp(-delta * 10))

func acquire_target() -> Vector2:
	var player_nodes: Array[Node] = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player: Node2D = player_nodes[0] as Node2D
		return player.global_position
	return Vector2.ZERO
