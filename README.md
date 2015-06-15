Team Name
To Be Decided

# Maze-Final-Project
Helen Li and Felicity Ng's final project APCS2, Mr. K, period 6

Brief Description
A puzzle oriented game. The player traverses through a maze, solving puzzles in order to reach the center room, which contains the objective that would win the game. The puzzles could be spot-the-difference or sliding puzzle.

Development Log
5/25/15: Started working on maze and how to implement GameTile
5/26/15: Solidified how direction works in maze; North, East, South, West dependant + began/tried using keyPressed to                 navigate
         Fixed the bug of reading the file in with scanner
5/27/15: Tried to scan the maze in...but it's not work because of a processing bad character constant bug
5/28/15: Fixed scan for maze; started PuzzleTile game; can print image for Spot the Difference; Drew pictures for User                Interface
5/29/15: Worked on the Tile Puzzle Game
         Working on importing images drawn yesterday
5/29/15 (continued): broke git terminal
5/30/15: continued working on the tiles game; one tile is moving around. Still needs more work. Aim to finish this by Tuesday.
5/31/15: Continued working on graphics (drawing)
         Fixed the scanner thing in Processing by using loadStrings()
6/1/15:  Fixed git terminal and problems with merging
6/4/15:  A bit late, but worked on loading the direction images on the maze
         Helped set different modes for different screens
         Drew more images for Spot the Difference
6/5/15:  Displaying the arrow keys when the user moves around
         Displaying the Map Screen
         Will continue working on Puzzle Tile Game
6/7/15:  Made minimap display player's current location in the maze
         SpotTheDifference runs without problems independantly
         Created a basic format for puzzles so they could run in the maze (doesn't actually run in maze yet)
         Started to create inventory
         Decided on a definite way to put games into maze (Random doors, definite Boss location)
         Continued working on BossTile so it could check on inventory
         Spent a really long time on PuzzleTileGame -- the sliding thing thing works now
         Continue implementing PuzzleTileGame so it is compatible with the rest of the Puzzles
6/9/15:  Displays a screen when the puzzle is true
         Determined which doors contains a puzzle
         Will work on Boss Game this weekend
6/10/15: Started working on boss class
         Putting puzzles into map does not work
6/11/15: Redoing adding puzzles into map due to bugs
         Made the PuzzleTileGame playable while going through map (!)
         Need to fix some bugs in PuzzleTileGame
6/13/15: Working on the display to display games
         Fixed bugs in puzzle tile sliding
         Need to come up with different solvable puzzles for Puzzle Tile Game
         Virtually finished with behind the scenes workings for Boss fight
         Figuring out sprites and animation for Boss fight
6/14/15: Finally made PuzzleTile game displayable and solvable and playable (!)
         Finished boss fight
         Added beginning and end game screens
         Added music
         Made SpotTheDifference playable with rectables drawn around spots
         Fixed bugs in games
         Made nicer displays

What do we have as of 6/1?
https://github.com/FelicityPictures/Maze-Final-Project/tree/da799f245348205386565ccc8d86de92b8efd5c0
INSTRUCTIONS: Look at Maze_Final_Project.pde (for bordered map) and PuzzleTileGame.pde (for Puzzle Tile game). Not much progress, but should be able to compile.
Not much :/ much but we have loaded a nice map, and we are beginning the games. More progress will come this week.

What do we have as of 6/8?
https://github.com/FelicityPictures/Maze-Final-Project/tree/575049b52b35455f8da6b60d3131dcd30801aed6
INSTRUCTIONS: Look at Maze_Final_Project.pde.
As of now, running it and pressing 'P' will only allow for the user to navigate around the map, but we already of about two of the games implemented.

*********************FINAL Version:********************
INSTRUCTIONS: Look at Maze_Final_Project.pde
Increase maximum available memory to something very high (We had 3000 MBs just to be safe)
Import Minim Library
NOTE: Not many images were made for the puzzles so there are bound to be repeats
Puzzle tile sliding game is played by clicking on certain tiles to be slided.
For Spot The Difference, click the differences on the image on the RIGHT

Used a source for the algorithm for the puzzle tile game:
https://www.cs.bham.ac.uk/~mdr/teaching/modules04/java2/TilesSolvability.html

Took images from:
http://zelda.wikia.com/wiki/Ganondorf?file=Ganondorf_%2528Twilight_Princess%2529.png
https://cdn2.scratch.mit.edu/get_image/gallery/713528_200x130.png?v=1417379068.0
http://t3.gstatic.com/images?q=tbn:ANd9GcR9y4_idfqhbCNt7DuLlpfdtuuWlQaX1ioQcAYZMkbeTV8CxJs7
http://newartcolorz.com/images/2014/6/zelda-wallpaper-5134-5256-hd-wallpapers.jpg
http://p1.pichost.me/i/35/1579925.jpg
http://img15.deviantart.net/0142/i/2012/346/b/7/underground_sea_cave_by_kpopermaper-d5nsv8x.jpg
http://orig11.deviantart.net/3a74/f/2012/325/4/1/young_link_sprite_sheet_by_nintendoartist2-d5k7hvy.png

Used Sprite decomposer at:
http://www.alferdspritesheetunpacker.forkandbeard.co.uk/forkandBeard/apps/AlferdSpritesheetUnpacker/Download.aspx

Things to do:
1) Finish making the map appear and allow user to navigate (DONE)
2) Finish minigames, SpotTheDifference and PuzzleSlideTile (DONE)
3) Creating the boss game (DONE)
4) Difficulty levels
