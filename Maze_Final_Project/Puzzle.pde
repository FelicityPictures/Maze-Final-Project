public class Puzzle {
  boolean solved;
  ArrayList<Integer>rectangles = new ArrayList<Integer>();


  public Puzzle() {
    solved = false;
  }

  public boolean isSolved() {
    return solved;
  }

  public void show() {
  }

  public void play() {
  }

  public void play(int x, int y, boolean changeDir) {
  }

  public void setX(int xc) {
  }

  public void setY(int yc) {
  }

  public boolean playable() {
    return true;
  }

  public boolean validClick(int x, int y) {
    return false;
  }

  public void drawRect() {
  }


  boolean getGameMode() {
    return false;
  }

  void clearRect() {
    rectangles.clear();
  }
}

