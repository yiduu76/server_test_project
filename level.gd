extends Node2D

func _ready():
	# We only need to spawn players on the server.
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(del_player)

func add_player(id: int):
	var character = preload("res://player.tscn").instantiate()
	character.player = id
	character.name = str(id)
	$Players.add_child(character, true)
	Myserver.peers_map[id]=character
	print(id,Myserver.peers_map)

func del_player(id: int):
	if not $Players.has_node(str(id)):
		return
	$Players.get_node(str(id)).queue_free()
	
