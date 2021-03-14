extends Control


export (String) var first_scene


func _ready():
	Global.goto_scene(first_scene)
	pass 
