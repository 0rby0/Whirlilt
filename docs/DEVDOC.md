# SpinR Development Document
#### Last Updated: 12/01/2026 | First Created: 09/01/2026

## Notes
* All dates will be written in the format dd/mm/yyyy

## Production changes from DesignDoc
### Spinning
The square being rotated around the center point has been seperated out into its own prefab.

### Orbs
There is currently no checking if the orb needs to be visible since the orb is either created or deleted.

### Accuracy
There is currently no failure condition.

###  Maps
Data is stored in .json rather than .txt.
Currently the map creation process is entirely manual.

## Feature Planning
### Map creator
This will require two parts: The map creator and a map selector or loader.

The map creator needs the following:
* Input of a map title and BPM
* Input of an audio file
* Reading the length of the audio track
* Converting the audio to the required format
* Playing the audio with a timeline
* Creating orbs with start and end beats as well as setting their angle
* Showing where orbs will be at any given point in the map
* Exporting the map
* Reading the map file to allow for editing

The map loader needs the following:
* Collection of the file name to read
* Redirecting to the game scene with the new file path
* File reading is already handled from the Design Doc

The map loader could either be done with a file selector or by having the game read a folder and load any .spr files it finds. The latter would be
a better choice as it allows for a more cohesive and error avoidant interface.

The file selector can load in multiple instances of a button with the file name without the .spr extension. Pushing each new button onto a scrollable
box. Then, when a button is clicked, the name value of that file can be used to create the path to be read by the map loader and the game scene can
be loaded.

The map creator is rather complex, so it can be broken down even further into a few parts:
* Basic info creation / selection
* The timeline
* File creation
* File loading

Basic information entry is straight forward, the user types the name of the map into a text input which the game can read. The user sets the BPM with
a number counter that can also be typed in (With numbers only). The music is selected with a file selector menu.

All of this information can be stored in a temporary variable(s).

The file creation involves creating the two required files (.json and .mp3) in a folder, loading the respective information into them, zipping the
folder and then renaming it to [mapname].spr all of which would occur in the maps folder in the SpinR folder within the users data directory.

Reading is as easy as reading for a map. Load the file path with a menu, read the information, load the information in its respective places. When
resaving the data, just reverse the creation process before you update the data and then repeat the creation process.

The hardest part of this is the timeline. This itself even has a few smaller parts:
* A scrollable box with a selection point which can be dragged to change the current beat.
* Each orb needs to work out when it should be present and where it should be.
* The music shouldn't play if the timeline is being scrubbed.
* A play / pause button which should play the map from the current beat and the music from the current timecode.
* The timeline also needs to know how long the map is in beats and what beats are when.

To begin: The length of the audio file can be gathered from the audio file, we can then take the BPM and divide the length by the BPM. This will give
us the amount of beats in the track.

For example:
A 1 minute track is 60 seconds. If the track is 60 BPM, then there should be 1 beat every 1 second and there should be 60 beats.

Translating the beat to timestamp is as simple as taking the current beat and multiply it by the amount of time between beats.

For example:
Beat 90 of a track at 30 BPM. 1 beats every 2 seconds means that 45 seconds have passed in the audio.

The music will only play if the play button is pressed. At which point the track will play from the current calculated timestamp.

The timeline can be represented by a rectangle on a horizontal scroll box. This rectangle can then be broken up into segments which the ticker can
magnetise or lock to. The number of segments would change based on the length and BPM of the map. Then, depending on the segment that the ticker is
currently touching, the beat would be set.

When the play button is pressed, the timeline should lock and the beat counter should count up while moving the ticker along to the corresponding
sections.

Orbs know when they should have started and stopped existing / moving, so they can compare their start and end point to the updated beat when the
ticker is moved to a new segment. If the current beat is between the start and end point, then show the orb. For distance, the Design Doc mentions
that the orbs are set up in such a way that they can be moved forward and back based on the current beat being multiplied by distances and start
end points.