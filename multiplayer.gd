extends Node

const PORT = 4433

func start_game():
	$UI.hide()
	if multiplayer.is_server():
		change_level.call_deferred(load("res://level.tscn"))

func change_level(scene: PackedScene):
	var level = $Level
	level.add_child(scene.instantiate())
	
func _on_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	start_game()

func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("127.0.0.1", PORT)
	multiplayer.multiplayer_peer = peer
	start_game()
