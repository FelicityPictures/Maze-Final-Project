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
 Y: NSE
 P: SWE
 U: NWE
 A: NESW
 */


public class GameTile {
  char direction;
  boolean door;
  PImage big, small;

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
      small = loadImage("Images/NSE.png");
      big = loadImage("Images/NSE Inside.png");
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

  public void MapDisplay() {
    image(big, 100, 100);
  }

  //used by Maze to check if the point player clicked is valid
  //when clicked in main, inputs NESW into char and this method
  //checks if valid
  public boolean ValidClick(char d) {
    if (d == 'N') {
      if (direction == 'T' || direction == 'B' ||
        direction == 'C' || direction == 'K' ||
        direction == 'Y' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'S') {
      if (direction == 'T' || direction == 'D' ||
        direction == 'L' || direction == 'K' ||
        direction == 'Y' || direction == 'P' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'E') {
      if (direction == 'F' || direction == 'B' ||
        direction == 'D' || direction == 'Y' ||
        direction == 'P' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    if (d == 'W') {
      if (direction == 'F' || direction == 'C' ||
        direction == 'L' || direction == 'K' ||
        direction == 'P' || direction == 'U' ||
        direction == 'A') {
        return true;
      }
    }
    return false;
  }

  public void PlayerSees() {
    image(big, 0, 0);
  }

  String toString() {
    return Character.toString(direction);
  }
}

