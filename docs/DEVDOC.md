# SpinR Development Document
#### Last Updated: 26/01/2026 | First Created: 09/01/2026

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

- Amendment: Markers
There needs to be some way to show where on the timeline the orbs are being created and deleted. To do so I can create two textures which can be used
on a sprite, swapped out based on a variable. I can then create instances of these on the screen above the timeline. Creating them in the right place
will need some math to calculate the y position based on the slider value.

Something like taking the width of the screen (which the timeline covers) then dividing it by the number of ticks on the timeline to get the pixel
width of each chunk, then divide the chunk width by 2 to center on the chunk. You can then take the current beat, subtract 1, multiply by the
pixel width, and then add the half amount. This should give the correct x position for the marker.

### Changes During Implementation
#### File Loader
The file loader uses the second discussed option of a menu reading one foler for all .spr files. All other discussed methods seem to be unchanged.

#### Map Maker
All basic information entry and storage is the same as discussed.

File writing is slightly different as the files are created directly in a .spr file rather than a zip first.

Reading uses the same method as the selection screen but loads the information from the file instead, with the exception of the audio file.

Getting the audio length uses the stream player not the file but otherwise is the same as discussed.

Currently the map just plays from the start when the play button is pressed. Adding the ability to start from a specific point, while easy to do and
useful in some situations is not currently a priority or really necesarry.

The play button hides the timeline rather than locking it. And the ticker doesn't move. Instead there is a timer that increases the beat when it
expires. Similarly to the reegular gameplay.

The scroll bar has been implemented with a Godot slider node using the ticks as the magenetising marks. Otherwise the same.

The orbs are implemented as discussed. Although they have been fixed by changing the orb position variable to be an origin point not a current point.

Markers are the same, with the exception of the half and -1 part, which are not neccesary.

### Main Menu
The main menu will be a circle to fit with the rotation theme of the game. The circle will be divided into even parts for each menu/gamemode.

Current segments are:
* Play
* Create
* Exit

Next, a settings menu needs to be added.

The order of the segments will be:
Play - Top
Create - Right
Exit - Bottom
Settings - Left

Selection can be handled with an area node on each button and a modified version of the players spinner.

### Changes During Implementation
No changes were made during implementation.

### Settings Menu
The settings menu is currently only able to house the control input option. That being said, it can be a new scene with a back button and a'
collection of buttons to change settings in the global variables script.

### Changes During Implementation
No changes are made.

## At this point the game is now in Version 2.0.0

### Orb Update
Currently the game uses two codes for the orbs. The one for the map maker is correct as it uses the original prototype code. The code for the
map player needs to be updated to use the correct code.

### Changes during implementation
There is now a 3 beat delay before the music begins to allow the game to load the orbs as there seems to be some sort of proccessing delay.

### Orb Movement Smoothing
Currently the orbs are very jittery as they have no inbetween points between the beats. This can be fixed by adding tweens in the orb movement code.

### Changes During Emplementation
Two new global variables were made to track the amount of time the tweens have for animation, one for normal play and one for map maker repsectively.

### Multi-Map Fix
Currently the entire game needs to be restarted to play a second map. This can be fixed by reseting the global beat variable to 0 when the map ends.

### Practice Mode
To make demonstrating the game easier, practice mode will be useful to have. This can be done by having a map that effectively proceduraly generates
a randomised map until the player exits.

### Changes during implementation
There was some attempt to make the orb tweening smoother as it was very jittery. It still has a minor jitter when the beat increments, but it is much
less noticable now. The changes made were giving extra move time, using parallel and using out_in easing.

There were no changes to the practice mode plans.

The main menu has now been updated to have a sub menu to choose between normal play or practice mode.