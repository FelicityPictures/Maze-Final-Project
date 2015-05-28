import java.util.*;
import java.io.*;

Random r;
GameTile[][] map;
int w,h;

void setup() {
  w=1000;
  h=700;
  size(w, h);
  r = new Random();
  int filenumber = r.nextInt(3);
  //use random to determine which game file to use
  try {
    Scanner scan = new Scanner(new File("TestMaze.txt"));  
    map = new GameTile[scan.nextInt()][scan.nextInt()];
    int startx = scan.nextInt();
    int starty = scan.nextInt();
    for(int i=0; i<map.length; i++){
      String sub = scan.next();
      for (int ii=0; ii<map[0].length; ii++) {
        map[i][ii]= new GameTile(sub.charAt(ii), false);
      }
    }
  }
  catch(FileNotFoundException e) {
  }
  SpotTheDifference f = new SpotTheDifference(1,w,h);
  f.print();
}

void mouseClicked(){
  if(mousePressed==true){
    println("" + mouseX + "" + mouseY);
  }
}

