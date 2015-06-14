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
  PImage big, small, end;
  PImage border = loadImage("Images/Blank.png");
  boolean isPuzzleTile = false;
  int x, y;
  //  PuzzleTileGame tile = new PuzzleTileGame();
  Puzzle puzzle;


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
    end = loadImage("Images/BossDoor.png");
    direction = d;
    door = dr;
    if (door) {
      Random r = new Random();
      int randomP = r.nextInt(2);
      if (randomP==0) {
        puzzle = new PuzzleTileGame("tilegame.jpg", 3);
        isPuzzleTile = true;
      } else {
        puzzle = new SpotTheDifference(r.nextInt(2)+1, 1000, 700);
        isPuzzleTile = false;
      }
    }
  }

  public GameTile(GameTile other) {
    this(other.getDirection(), true);
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

  public void PlayerSees(int xc, int yc, boolean changeDir, boolean endd) {
    if (changeDir) {
      image(big, 55, 55);
      image(border, 0, 0);
    }
    if (door) {
      if (isPuzzleTile) {
        //        image(big, 55, 55);
        //        image(border, 0, 0);
        //        fill(255, 200, 200);
        //        rect(55, 55, width - 110, height - 110);
        //need a constructor Puzzle p = new PuzzleTileGame();
        isPuzzleTile = true;
        puzzle.play(xc, yc, changeDir);
        //        puzzle.setX(xc);
        //        puzzle.setY(yc);


        //put the game stuff here

        if (puzzle.isSolved()) {
          door = false;
          isPuzzleTile = false;
          image(big, 55, 55);
        }
      } else {
        image(big, 55, 55);
        //play the Spot the Difference Game
<<<<<<< HEAD
        fill(255, 200, 200);
        rect(55, 55, width - 110, height - 110);
        //     SpotTheDifference game = new SpotTheDifference(r.nextInt(2)+1, 1000, 700);
        puzzle.show();
        puzzle.validClick(xc, yc);
        if (!puzzle.playable()) {
          door = false;
          image(big, 55, 55);
=======
        puzzle.show();
        while (puzzle.playable()) {
          puzzle.show();
          puzzle.validClick(xc, yc);
>>>>>>> FHome
        }
      }
    } else {
      if (endd) {
        image(end, 55, 55);
      } else {
        image(big, 55, 55);
      }
    }
  }
  String toString() {
    return Character.toString(direction);
  }

  boolean getIsPuzzleTile() {
    return isPuzzleTile;
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

