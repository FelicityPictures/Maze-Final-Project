import java.util.*;
import java.io.*;
import java.io.File;

Random r;
GameTile[][] map;
int mode = 0;


void setup() {
  size(1000, 700);
  background(0);
  r = new Random();
  int filenumber = r.nextInt(3);
  //use random to determine which game file to use

  String[] lines = loadStrings("TestMaze.txt");
  map = new GameTile[Integer.parseInt(lines[0])][Integer.parseInt(lines[1])];
  int startx = Integer.parseInt(lines[2]);
  int starty = Integer.parseInt(lines[3]);
  String sub = "";
  for (int i=0; i<map.length; i++) {
    sub = lines[4+i];
    for (int ii=0; ii<map[0].length; ii++) {
      map[i][ii]= new GameTile(sub.charAt(ii), false);
    }
  }

//DEBUG: print the maze with the following code
    String ans = "";
  int place = 0;
  int place2 = 0;
  while (place < map.length) {
    while (place2 < map[0].length) {
      ans += map[place][place2];
      place2++;
    }
    place2 = 0;
    println(ans);
    place++;
  }
}

//void displayMap() {
//  PImage border = loadImage("Border.png");
//  image(border, 0, 0);
//  // fill (150, 150, 150, 80);
//  // rect(100, 100, width-200, height-200);
//}

void draw() {
  //  displayMap();
  //image(West,200,200);
  //  PuzzleTileGame t = new PuzzleTileGame();
}

