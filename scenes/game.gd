extends Node2D

var car_scene : PackedScene = preload("res://scenes/car.tscn")
var score: int 


func _on_finish_area_2d_body_entered(body):
	call_deferred("change_scene")
	Global.score = score

func change_scene():
	get_tree().change_scene_to_file("res://scenes/title.tscn")
	
	
func _on_car_timer_timeout(): # Spawns cars
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect('body_entered', go_to_title)

func go_to_title(_body):
	call_deferred("change_scene")
	
	


func _on_score_timer_timeout():
	score += 1
	$CanvasLayer/Label.text =  str(score)
