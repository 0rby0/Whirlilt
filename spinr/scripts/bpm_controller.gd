extends TextEdit

var BPM = 100

func bpm_down():
	BPM -= 1
	self.text = str(BPM)
	
func bpm_up():
	BPM += 1
	self.text = str(BPM)
