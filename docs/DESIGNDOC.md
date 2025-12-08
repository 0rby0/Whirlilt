# SpinR Design Document
#### Last Updated: 08/12/2025 | First Created: 01/12/2025

## Notes
* All dates will be written in the format dd/mm/yyyy
* Any ideas discussed in the final section of this document will be expanded on or otherwise furthur discussed in DEVDOC.md after the main gameplay
is completed.

## What is SpinR?
SpinR is a rythm game in which the player controls a point on a circle in the centre of the screen. The player rotates this point around the circle
to hit orbs that are moving towards the centre of the screen. The player must hit the orbs in time with the music to gain score and avoid failing the
game.

## Why Godot?
The Godot game engine was chosen because making the game with a game engine will be substantially faster and easier and Godot specifically was chosen
because it is a well documented engine with a programming language I am already familiar with. This means I won't have to try and learn a new set of
systems, tools and syntax to create the game, which should lead to a better produced outcome.

## Core Gameplay

### Spinning
The spinning of SpinR is achieved by having a square (or possibly other shapes) as a child node of a marker. This allows the square to rotate around
a point rather than spinning in place. A collision shape can then be attached to the square to make the orbs hit the square. The rotation of the
square can be achieved by using the "vector" of the joystick and rotating the player to face that point. Alternatively, as a temporary option for
testing, the object can be rotated to face the mouse using the mouse position gathered by the engine.

### Orbs
Orbs are a object with a script attached. This script will check the current beat number and determine whether the orb should be visible to the
player. If it is, then it uses the equation:

distance_to_end = distance_to_travel - (speed_to_travel * (current_beat - start_on_beat))

Where:
* distance_to_end is the amount of distance between the orb and the center of the screen.
* distance_to_travel is the current amount of space between the orb and the screen center.
* speed_to_travel is how much the orb has to move to cover the total given distance in the time between the start beat and end beat. E.g. if the orb
has to travel 10 pixels in 2 seconds, then the speed is 10/2 which is 5.
* current_beat is the number returned when the beat variable is checked.
* start_on_beat is the beat the orb should start on.

The end result of this is that the distance_to_travel will be equal to the current distance to the center, minus a distance determined by the amount
of beats that have passed since the orb started moving, multiplied by the speed that the orb is moving, making it an increment of the speed.

The current position of the orb is then taken and the distance_to_end variable is then added to the current position.

As a side note: this method also allows orbs to move backwards.

Orbs would need to be created when needed rather than being constant, since having hundreds or even thousands of orbs all reading a variable and
making decisions at once would cause performance issues on weaker proccessors.

To handle orb creation there will be a new node in the scene which reads the current beat once whenever the beat variable updates and compares the
current beat number to the number value of the selected index in an array. If the numbers match, then it creates the orb and moves to the next index.

For example:
* The map is loaded and all of the start beats are put into an array in order from smallesest to largest.
* The beat then increases to 1.
* The orb creator sees that the beat has changed and checks if index 0 of the array is equal to 1.
* Index 0 is equal to 1, so the creator makes a new orb node.
* The creator then increases the index to 1.
* The beat updates again to 2.
* The creator sees this and checks if index 1 in the array is equal to 2.
* It isn't, so the orb creator does nothing.
* The beat inceases to 3.
* Creator checks if index 1 in the array equals 3.
* It does, so the creator makes an orb node and inceases the index to 2.

### Accuracy
Accuracy has two parts to the system. The first is hitting and missing orbs. And the second is the calculation of the players accuracy. Starting with
the hitting or missing of orbs, simply, if an orb touches the players square or a hitbox inside of the circle that the player rotates around, then
the orb node will be deleted. The calculation will occur by having the orb increase either a missed_orb variable or a hit_orb variable. These
two variables can then be added together and then then the hit_orb variable can be divided by the sum. This would then tell the accuracy percentage
as a float which could then be multiplied by 100 and transformed into an intiger to remove the decimal place, leaving a user friendly accuracy number
that can be displayed.

The player will also be able to fail the game is they recieve 5 missed_orbs in a row. This can be achieved by having a fail_ticker variable which is
increased by 1 each time the missed_orb variable is also increased. This variable could then be reset to 0 when the hit_orb variable is increased. If
this variable ever reaches or passes 5, then the game should trigger a failure state.

### Maps
Maps are a file containing information about where and when orbs should be fired as well as other important information.

The information included within the map includes:
* The title of the map
* The BPM of the map
* A music file to be played
* An array with the rotation, start and end beats of each orb stored in the form of a dictionary (for easier reading and writing).

All of this information is stored in two files: A .mp3 file and a .txt file. The .mp3 file contains the music and the .txt contains a dictionary
containing the title, bpm, and array (once again, a dictionary is used for easier read/write). These two files are then compressed and the .zip file
is then renamed to a .spr file. This makes the user unable to open the folder with any software without changing the file extension back to .zip.
When the user opens a map file with the game, the game will uncompress and read the files, storing the relevant data before re-compressing the file.

### Beats
Beats are handled with a number in the map file under the variable name "BPM" this is then read by the game and put into the equation:

time = 1 / ( BPM / 60 )

This gives the amount of time that needs to pass between each beat. This time can then be given to a timer which, when it runs out, can increment a
beat variable by 1 and restart the timer until the map length is reached or passed. This method would theoretically be able to handle any BPM where
the resulting time is greater than 0.1, which is the smallest time the Godot engine's timer can handle stably.

Therefore the highest BPM possible is 600 since:
* 600 / 60 = 10
* 1 / 10 = 0.1

## Future Possibilities and Ideas
A list of ideas for future expansions to the project:
* Map creator
* Practice mode
* Two-player
* Single-player with two circles
* Official mouse implementation
