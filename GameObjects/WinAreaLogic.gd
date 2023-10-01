extends Node2D

export(String, 'Player1', 'Player2') var CurrentPlayer = 'Player1'
signal Goal(Player)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.name == "Ball":
		emit_signal("Goal", CurrentPlayer)
