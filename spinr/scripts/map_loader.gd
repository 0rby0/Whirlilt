extends Node2D

# Returns the players Roaming folder
var userPath = OS.get_data_dir()

# Sets a path for the game to create and store maps in
var filePath = userPath + "/SpinR/" + global.mapTitle +".spr"

func _ready():
	var reader = ZIPReader.new()
	reader.open(filePath)
	
	# The unproccessed and unusable contents of the file
	var mapRawData = reader.read_file("map.json")
	
	# Make the raw data readable as text
	var mapString = mapRawData.get_string_from_utf8()
	
	# Makes the readable data usable by the game
	var parseMapData = JSON.parse_string(mapString)
	
	var mapTemp = parseMapData
	
	# Stores the information in its respective places
	global.map = mapTemp.beatMap
	global.BPM = mapTemp.BPM
	
	# Opens and loads the music from the map
	var audioFile = reader.read_file("audio.mp3")
	var audio = AudioStreamMP3.load_from_buffer(audioFile)
	
	# Sets the audio player to use the loaded audio
	$"Music Player".stream = audio
	$"Music Player".play()
	
	# Closes all opened files to avoid unneccesary recourse usage
	reader.close()
