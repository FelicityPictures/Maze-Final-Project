/*
E: Boss
T: NS
F: EW
B: NE
C: NW
D: SE
L: SW
K: NSW
Y: NSE
P: SWE
U: NWE
A: NESW
*/

PImage blank = loadImage("Blank.png");
PImage border = loadImage("Border.png");
PImage East = loadImage("East.png");
PImage ESW = loadImage("ESW.png");
PImage EW = loadImage("EW.png");
PImage InsideMazeNESW = loadImage("Inside Maze NESW.png");
PImage NE = loadImage("NE.png");
PImage NES = loadImage("NES.png");
PImage NESW = loadImage("NESW.png");
PImage NEW = loadImage("NEW.png");
PImage North = loadImage("North.png");
PImage NS = loadImage("NS.png");
PImage NSW = loadImage("NSW.png");
PImage NW = loadImage("NW.png");
PImage SE = loadImage("SE.png");
PImage South = loadImage("South.png");
PImage SW = loadImage("SW.png");
PImage West = loadImage("West.png");

public class GameTile {
  char direction;
  boolean door;

  public GameTile(char d,boolean dr){
    direction = d;
    door = dr;
  }
  
  //used by Maze to check if the point player clicked is valid
  //when clicked in main, inputs NESW into char and this method
  //checks if valid
  public boolean ValidClick(char d){
      if(d == 'N'){
          if(direction == 'T' || direction == 'B' ||
             direction == 'C' || direction == 'K' ||
             direction == 'Y' || direction == 'U' ||
             direction == 'A'){
               return true;
             }
      }
      if(d == 'S'){
          if(direction == 'T' || direction == 'D' ||
             direction == 'L' || direction == 'K' ||
             direction == 'Y' || direction == 'P' ||
             direction == 'A'){
               return true;
             }
      }
      if(d == 'E'){
          if(direction == 'F' || direction == 'B' ||
             direction == 'D' || direction == 'Y' ||
             direction == 'P' || direction == 'U' ||
             direction == 'A'){
               return true;
             }
      }
      if(d == 'W'){
          if(direction == 'F' || direction == 'C' ||
             direction == 'L' || direction == 'K' ||
             direction == 'P' || direction == 'U' ||
             direction == 'A'){
               return true;
             }
      }
      return false;
  }
  
  /*
  void keyPressed(){
    println(keyCode);
    if (keyCode==119 && ValidClick('N')){
      //go north
    }else{
      if (keyCode==97 && ValidClick('W')){
        //go west
      }else{
        if (keyCode==100 && ValidClick('E')){
          //go east
        }else{
          if (keyCode==115 && ValidClick('S')){
            //go south
          }
        }
      }
    }
  }
  */

}
