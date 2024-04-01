#Global
extends Node
var peers_map:Dictionary
@rpc("any_peer")
func player_move(direction:Vector2):
	var id:int = multiplayer.get_remote_sender_id()
	if peers_map.has(id):
		var player = peers_map[id]
		player.global_position+=direction*10

