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


public class GameTile {
  char direction;
  boolean door;

  public GameTile(char d, boolean dr) {
    direction = d;
    door = dr;
  }

  void setup() {
  }

  public void out() {
    if (direction == 'S') {
      PImage s = loadImage("Images/S.png");
      image(s, 100, 100);
    }
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

  String toString() {
    return Character.toString(direction);
  }
}

