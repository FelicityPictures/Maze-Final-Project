public class ClickCoordinates {
  int minX, maxX, minY, maxY;

  public ClickCoordinates(int x, int y, int xx, int yy) {
    minX=x;
    maxX=xx;
    minY=y;
    maxY=yy;
  }

  public boolean clickable(int x, int y) {
    if (x>=minX && x<=maxX && y>=minY && y<=maxY) {
      return true;
    } else {
      return false;
    }
  }

  public int getX() {
    return minX;
  }

  public int getY() {
    return minY;
  }

  public int rangeX() {
    return maxX-minX;
  }

  public int rangeY() {
    return maxY-minY;
  }
}

