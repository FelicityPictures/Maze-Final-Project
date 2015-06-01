import java.util.*;
import java.io.*;

Random r;
GameTile[][] map;
int mode = 0;

void setup() {
  size(1000, 700);
  background(0);
  r = new Random();
  int filenumber = r.nextInt(3);
  //use random to determine which game file to use
  try {
    Scanner scan = new Scanner(new File("TestMaze.txt"));  
    map = new GameTile[scan.nextInt()][scan.nextInt()];
    int startx = scan.nextInt();
    int starty = scan.nextInt();
    for (int i=0; i<map.length; i++) {
      String sub = scan.next();
      for (int ii=0; ii<map[0].length; ii++) {
        map[i][ii]= new GameTile(sub.charAt(ii), false);
      }
    }
  }
  catch(FileNotFoundException e) {
  }
}

void displayMap() {
  PImage border = loadImage("Images/Border.png");
  image(border,0,0);
 // fill (150, 150, 150, 80);
 // rect(100, 100, width-200, height-200);
}

void draw() {
  displayMap();
//  map[1][1].out();
  //image(West,200,200);
  //  PuzzleTileGame t = new PuzzleTileGame();
}

