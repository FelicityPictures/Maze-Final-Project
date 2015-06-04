import java.util.*;
import java.io.*;
import java.io.File;

Random r;
GameTile[][] map;
int w, h;

void setup() {
  w=1000;
  h=700;
  size(w, h);
  int mode = 0;
  GameTile current;

  int currentRow, currentCol;
  background(0);
  r = new Random();
  int filenumber = r.nextInt(3);
  //use random to determine which game file to use

  String[] lines = loadStrings("TestMaze.txt");
  map = new GameTile[Integer.parseInt(lines[0])][Integer.parseInt(lines[1])];
  int startx = Integer.parseInt(lines[2]);
  int starty = Integer.parseInt(lines[3]);
  currentCol =  startx;
  currentRow = starty;
  String sub = "";
  for (int i=0; i<map.length; i++) {
    sub = lines[4+i];
    for (int ii=0; ii<map[0].length; ii++) {
      map[i][ii]= new GameTile(sub.charAt(ii), false);
    }
  }

  current = map[startx][starty];

  //  //DEBUG: print the maze with the following code
  //  String ans = "";
  //  int place = 0;
  //  int place2 = 0;
  //  while (place < map.length) {
  //    while (place2 < map[0].length) {
  //      ans += map[place][place2];
  //      place2++;
  //    }
  //    place2 = 0;
  //    println(ans);
  //    place++;
  //  }


  PImage blank = loadImage("Images/Blank.png");
  PImage East = loadImage("Images/E.png");
  PImage ESW = loadImage("Images/ESW.png");
  PImage EW = loadImage("Images/EW.png");
  PImage InsideMazeNESW = loadImage("Images/Inside Maze NESW.png");
  PImage NE = loadImage("Images/NE.png");
  PImage NES = loadImage("Images/NES.png");
  PImage NESW = loadImage("Images/NESW.png");
  PImage NEW = loadImage("Images/NEW.png");
  //  PImage North = loadImage("Images/North.png");
  PImage North = loadImage("Images/N.png");
  PImage NS = loadImage("Images/NS.png");
  PImage NSW = loadImage("Images/NSW.png");
  PImage NW = loadImage("Images/NW.png");
  PImage SE = loadImage("Images/SE.png");
  //  PImage South = loadImage("Images/South.png");
  PImage South = loadImage("Images/S.png");
  PImage SW = loadImage("Images/SW.png");
  //  PImage West = loadImage("Images/West.png");
  PImage West = loadImage("Images/W.png");
}

void displayMap() {
  PImage border = loadImage("Images/Border.png");
  image(border, 0, 0);
  // fill (150, 150, 150, 80);
  // rect(100, 100, width-200, height-200);
}

void loadArrows(GameTile g) {
}

void keyPressed() {
  println(keyCode);
  if (keyCode==119 && current.ValidClick('N')) {
    //go north
    currentRow--;
    current = map[currentRow][currentCol];
  } else {
    if (keyCode==97 && current.ValidClick('W')) {
      //go west
      currentCol--;
      current = map[currentRow][currentCol];
    } else {
      if (keyCode==100 && current.ValidClick('E')) {
        //go east
        currentCol++;
        current = map[currentRow][currentCol];
      } else {
        if (keyCode==115 && current.ValidClick('S')) {
          //go south
          currentRow++;
          current = map[currentRow][currentCol];
        }
      }
    }
  }
  SpotTheDifference f = new SpotTheDifference(1, w, h);
  f.show();
}

void mouseClicked() {
  if (mousePressed==true) {
    println("" + mouseX + "" + mouseY);
  }
}

void draw() {
  displayMap();
  //image(West,200,200);
  //  PuzzleTileGame t = new PuzzleTileGame();
}

