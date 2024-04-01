extends Sprite2D

@export var player := 1 :
	set(id):
		player = id
func _ready():
	pass 

func _unhandled_input(event):
	var input_vec=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	Myserver.player_move.rpc(input_vec)
