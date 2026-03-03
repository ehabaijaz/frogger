extends Control

func _process(_delta: float):
	if Input.is_action_just_pressed('something'):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
		
func _ready():
	$Score.text = "High Score: " + str(Global.score)
