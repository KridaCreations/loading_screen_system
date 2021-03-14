


extends Node

var displayed = 0
var loader
var wait_frames
var time_max = 100
var current_scence=null
var present_gun = 6
var second_gun = 6
var present_character = 1
var no_of_characters=3
var no_of_guns=7
var loader_instance

func mod(x,y):
	var z = int(x)/int(y)
	x=x-(z*y)
	return x

func _ready():
	
	var root = get_tree().get_root()
	current_scence = root.get_child(2)
	
func goto_scene(path):
	loader = ResourceLoader.load_interactive(path)
	Globalscence.get_node("ProgressBar").set_value(0)
	if loader == null:
		#show_error()
		return
	set_process(true)
	if current_scence !=null:
		current_scence.queue_free()
	
	wait_frames = 1

func _process(time):
	if loader == null:
		set_process(false)
		return
	
	if wait_frames > 0:
		wait_frames-=1
		return
	
	var t = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + time_max:
		
		var err = loader.poll()
		
		if err == ERR_FILE_EOF:
			var resource = loader.get_resource()
			loader = null
			Globalscence.get_node("ProgressBar").set_value(100)
			set_new_scence(resource)
			break
		elif err == OK:
			update_progress() 
		else:
			loader = null
			break

func set_new_scence(scence_resource):
	current_scence = scence_resource.instance()
	get_node("/root").add_child(current_scence)

func update_progress():
	var progress = (float(float(loader.get_stage())/float(loader.get_stage_count())))*100
	Globalscence.get_node("ProgressBar").set_value(progress)

