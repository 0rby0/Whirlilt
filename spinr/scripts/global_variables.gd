extends Node

# Settings
var input_type = "mouse"

# Map Variables
var beat = 0
var BPM = 60
var map
var mapTitle

# Map Maker Variables
var mm_beat = 0
var focused = false

var mmTitle
var mmBPM
var mmAudioFile
var mmTrackLengthSec
var mmMapSelect

var tickCount = 100

var editing = false

var mmMap = []

# Accuracy
var hit_orbs = 0.0
var missed_orbs = 0.0
