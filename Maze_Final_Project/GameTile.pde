/*
 N: N
 E: E
 S: S
 W: W
 T: NS
 F: EW
 B: NE
 C: NW
 D: SE
 L: SW
 K: NSW
 Y: NES
 P: SWE
 U: NWE
 A: NESW
 */


public class GameTile {
  char direction;
  boolean door;
  PImage big, small;
  boolean isPuzzleTile = false;
  int x, y;

  public GameTile(char d, boolean dr) {
    if (d=='#') {
      small = loadImage("Images/Blank.png");
    }
    if (d=='N') {
      small = loadImage("Images/N.png");
      big = loadImage("Images/N Inside.png");
    }
    if (d=='E') {
      small = loadImage("Images/E.png");
      big = loadImage("Images/E Inside.png");
    }
    if (d=='S') {
      small = loadImage("Images/S.png");
      big = loadImage("Images/S Inside.png");
    }
    if (d=='W') {
      small = loadImage("Images/W.png");
      big = loadImage("Images/W Inside.png");
    }
    if (d=='T') {
      small = loadImage("Images/NS.png");
      big = loadImage("Images/NS Inside.png");
    }
    if (d=='F') {
      small = loadImage("Images/EW.png");
      big = loadImage("Images/EW Inside.png");
    }
    if (d=='B') {
      small = loadImage("Images/NE.png");
      big = loadImage("Images/NE Inside.png");
    }
    if (d=='C') {
      small = loadImage("Images/NW.png");
      big = loadImage("Images/NW Inside.png");
    }
    if (d=='D') {
      small = loadImage("Images/SE.png");
      big = loadImage("Images/SE Inside.png");
    }
    if (d=='L') {
      small = loadImage("Images/SW.png");
      big = loadImage("Images/SW Inside.png");
    }
    if (d=='K') {
      small = loadImage("Images/NSW.png");
      big = loadImage("Images/NSW Inside.png");
    }
    if (d=='Y') {
      small = loadImage("Images/NES.png");
      big = loadImage("Images/NES Inside.png");
    }
    if (d=='P') {
      small = loadImage("Images/ESW.png");
      big = loadImage("Images/ESW Inside.png");
    }
    if (d=='U') {
      small = loadImage("Images/NEW.png");
      big = loadImage("Images/NEW Inside.png");
    }
    if (d=='A') {
      small = loadImage("Images/NESW.png");
      big = loadImage("Images/NESW Inside.png");
    }
    direction = d;
    door = dr;
  }

  public boolean puzzle() {
    return door;
  }

  public void makePuzzle() {
    door = true;
  }

  public char getDirection() {
    return direction;
  }

  public void MapDisplay(int x, int y) {
    image(small, x, y);
  }

  //used by Maze to check if the point player clicked is valid
  //when clicked in main, inputs NESW into char and this method
  //checks if valid
  public boolean ValidClick(char d) {
    if (d == 'N') {
      if (direction == 'N' || direction == 'T' || direction == 'B' ||
        direction == 'C' || direction == 'K' ||
        direction == 'Y' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'S') {
      if (direction == 'S' || direction == 'T' || direction == 'D' ||
        direction == 'L' || direction == 'K' ||
        direction == 'Y' || direction == 'P' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'E') {
      if (direction == 'E' || direction == 'F' || direction == 'B' ||
        direction == 'D' || direction == 'Y' ||
        direction == 'P' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'W') {
      if (direction == 'W' || direction == 'F' || direction == 'C' ||
        direction == 'L' || direction == 'K' ||
        direction == 'P' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    return false;
  }

  public void PlayerSees(int xc, int yc) {
    if (door) {
      //      Random r = new Random();
      //      if (r.nextInt(2)==0) {
      //need a constructor Puzzle p = new PuzzleTileGame();
      Puzzle tile = new PuzzleTileGame();
      isPuzzleTile = true;
      //      fill(50, 55, 100);
      //      rect(100, 100, width-200, height-200);
      tile.play(xc,yc);
        tile.play(xc, yc);
        println("XCXCXCXC" + xc);
        println("YCYCYCYC" + yc);
      

      //put the game stuff here

      if (tile.isSolved()) {
        door = false;
        image(big, 50, 50);
      }
      //      } else {
      //        Puzzle p = new SpotTheDifference(r.nextInt(2)+1, 1000, 700);
      //        fill(50, 55, 100);
      //        rect(100, 100, width-200, height-200);
      //
      //        //put the game stuff here
      //
      //        if (p.isSolved()) {
      //          door = false;
      //          image(big, 50, 50);

      //        }
      //      }
      // p.play();
    } else {
      image(big, 50, 50);
    }
  }

  boolean getIsPuzzleTile() {
    return isPuzzleTile;
  }


  String toString() {
    return Character.toString(direction);
  }

  void setX(int xc) {
    x = xc;
  }

  void setY(int yc) {
    y = yc;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}

