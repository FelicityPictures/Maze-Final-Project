public class ClickCoordinates {
  int minX, maxX, minY, maxY;

  public ClickCoordinates(int x, int y, int xx, int yy) {
    minX=x;
    maxX=xx;
    minY=y;
    maxY=yy;
  }

  public boolean clickable(int x, int y) {
//    if (x != 0 && y != 0) {
//      println("mouseX" + x);
//      println("mouseY" + y);
//      println("X" + minX + "    " + maxX);
//      println("Y" + minY + "    " + maxY);
//    }
    if (x>=minX && x<=maxX && y>=minY && y<=maxY) {
      println(true);
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
  
  public String toString(){
    return "" + minX + ", " + minY + " , " + maxX + " , " + maxY;
  }
}

