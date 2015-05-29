public class ClickCoordinates {
  int minX,maxX, minY, maxY;

  public ClickCoordinates(int x, int xx, int y, int yy) {
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

}

