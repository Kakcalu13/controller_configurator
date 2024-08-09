extends Node2D

var capabilities

# Called when the node enters the scene tree for the first time.
func _ready():
	capabilities = load_capabilities()
	var json = JSON.new()
	var error = json.parse(capabilities)
	if error == OK:
		capabilities = json.data
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", capabilities, " at line ", json.get_error_line())

	for i in capabilities['capabilities']['input']:
		print(i)
	

func load_capabilities():
	var file = FileAccess.open("res://configuration.json", FileAccess.READ)
	var content = file.get_as_text()
	return content
