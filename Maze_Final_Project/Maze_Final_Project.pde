//click 'P' to start playing

import java.util.*;
import java.io.*;
import java.io.File;

Random r;
GameTile[][] map;
int w, h;
GameTile current;
int currentRow, currentCol;
int mode = 0;
boolean seeMap = false;
ArrayList<Integer> mapImage = new ArrayList<Integer>();
PImage border;
int numberOfDoors;
int mx, my;

void setup() {
  w=1000;
  h=700;
  numberOfDoors = 4;
  size(w, h);
  int mode = 0;
  border = loadImage("Images/Border.png");  
  background(0);
  r = new Random();
  int filenumber = r.nextInt(3);
  //use random to determine which game file to use

  String[] lines = loadStrings("TestMaze.txt");
  map = new GameTile[Integer.parseInt(lines[0])][Integer.parseInt(lines[1])];
  int startx = Integer.parseInt(lines[2]);
  int starty = Integer.parseInt(lines[3]);
  int endx = Integer.parseInt(lines[4]);
  int endy = Integer.parseInt(lines[5]);
  currentCol =  startx;
  currentRow = starty;
  String sub = "";
  for (int i=0; i<map.length; i++) {
    sub = lines[6+i];
    for (int ii=0; ii<map[0].length; ii++) {    
      map[i][ii]= new GameTile(sub.charAt(ii), false);
    }
  }

  //  map[1][0] = new GameTile(map[1][0]);

  int puzzleX, puzzleY;
  for (int i=0; i<numberOfDoors; i++) {
    puzzleX = r.nextInt(map.length);
    puzzleY = r.nextInt(map[0].length);
    if (map[puzzleX][puzzleY].getDirection()!='#' && (puzzleX!=startx || puzzleY!=starty) &&
      (puzzleX!=endx || puzzleY !=endy) && !map[puzzleX][puzzleY].puzzle()) {
      map[puzzleX][puzzleY]=new GameTile(map[puzzleX][puzzleY]);
      println(puzzleX + " , " + puzzleY);
      println(map[puzzleX][puzzleY]);
    } else {
      i--;
    }
  }

  map[endx][endy]= new BossTile(map[endx][endy]);
  current = map[startx][starty];
  displayDefault();

  int mapx = 924;
  int mapy = 624;
  int i = -80;
  int ii = -80;
  while (i <= 80) {
    while (ii <= 80) {
      mapImage.add(mapx+i);
      mapImage.add(mapy+ii);
      ii++;
    }
    i++;
    ii = -80;
  }
}

static boolean inArray(ArrayList<Integer> xc, int x, int y) {
  int place = 0;
  while (place < xc.size ()) {
    if (xc.get(place) == x && xc.get(place+1) == y) {
      return true;
    }
    place++;
  }
  return false;
}

static boolean onImage(ArrayList<Integer> xc, ArrayList<Integer> yc, int x, int y) {
  int place = 0;
  while (place < xc.size ()) {
    if (xc.get(place) == x && yc.get(place) == y) {
      return true;
    }
    place++;
  }
  return false;
}

void displayDefault() {
  background(0);
  image(border, 0, 0);
  // fill (150, 150, 150, 80);
  // rect(100, 100, width-200, height-200);
}

void loadArrows(GameTile g) {
}

void keyPressed() {
  println(keyCode);
  if ((mode == 0) && (keyCode == 'P')) {
    mode = 1;
  }
  if (keyCode==38 && current.ValidClick('N')) {
    //go north
    currentRow--;
    current = map[currentRow][currentCol];
  } else {
    if (keyCode==37 && current.ValidClick('W')) {
      //go west
      currentCol--;
      current = map[currentRow][currentCol];
    } else {
      if (keyCode==39 && current.ValidClick('E')) {
        //go east
        currentCol++;
        current = map[currentRow][currentCol];
      } else {
        if (keyCode==40 && current.ValidClick('S')) {
          //go south
          currentRow++;
          current = map[currentRow][currentCol];
        }
      }
    }
  }
}

void mouseClicked() {
  println ("" + mouseX + "," + mouseY);
  if (inArray(mapImage, mouseX, mouseY)) {
    seeMap = !seeMap;
  }

  if (mode == 1 && current.getIsPuzzleTile()) {
    current.setX(mouseX);
    current.setY(mouseY);
    mx = mouseX;
    my = mouseY;
  }
}


void draw() {
  //  println("mode" + mode);
  if (mode == 0) {
    displayDefault();
  } else {
    if (mode == 1) {
      current.PlayerSees(mx, my);
      image(border, 0, 0);
      //   println(currentRow + "," + currentCol);
      if (current.puzzle() && current.getIsPuzzleTile()) {
        textSize(32);
        fill(255);
        text(("NUMBER OF STEPS TAKEN SO FAR: ______ "), 50, 30);
        text("Slide the puzzle tiles to create the image you see on the left. The missing tile should be the lower right hand tile. \n Good Luck!", 500, 30);
      }
    }
  } 
  if (seeMap) {
    //    fill(218, 218, 231, 20);
    //    rect(100, 100, width-200, height-200);
    int xx = (w/2)-(map.length*54/2);
    int yy = (h/2)-(map[0].length*54/2);
    for (int i=0; i<map[0].length; i++) {
      for (int m=0; m<map.length; m++) {
        map[m][i].MapDisplay(xx+i*54, yy+m*54);//(xx+i*54, yy+m*54);
      }
    }
    PImage here = loadImage("Images/CurrentDot.png");
    image(here, xx+(currentCol*54), yy+(currentRow*54));
  }

  //  displayMap();
  //image(West,200,200);
  //  PuzzleTileGame t = new PuzzleTileGame();
}

