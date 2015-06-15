public class SpotTheDifference extends Puzzle {
  PImage picture;
  PImage correct;
  int ScreenW, ScreenH;
  ArrayList<String> places = new ArrayList<String>();
  ArrayList<ClickCoordinates>solutions;
  int x, y;
  ArrayList<Integer>rectangles = new ArrayList<Integer>();


  public SpotTheDifference(int i, int w, int h) {
    super();
    correct = loadImage("Images/Red marker circle.png");
    picture = loadImage("Images/Spot The Difference " + i + ".png");
    solutions = new ArrayList<ClickCoordinates>();
    if (i==1) {
      solutions.add(new ClickCoordinates(552, 97, 674, 211));
      solutions.add(new ClickCoordinates(502, 77, 528, 105));
      solutions.add(new ClickCoordinates(536, 240, 575, 257));
      solutions.add(new ClickCoordinates(502, 278, 702, 355));
      solutions.add(new ClickCoordinates(802, 296, 840, 333));
    } else {
      solutions.add(new ClickCoordinates(593, 142, 664, 172));
      solutions.add(new ClickCoordinates(698, 103, 747, 136));
      solutions.add(new ClickCoordinates(874, 147, 902, 165));
      solutions.add(new ClickCoordinates(713, 544, 737, 565));
      solutions.add(new ClickCoordinates(914, 251, 932, 271));
    }
    //picture = loadImage("testImage.jpg");
    ScreenW = w;
    ScreenH = h;
    //set up ssolutions
  }

  public boolean playable() {
    if (solutions.size()>0) {
     
      solved = false;
      return true;
    } else {
      solved = true;
clearRect();
      return false;
    }
  }

  public boolean validClick(int xc, int yc) {
    setX(xc);
    setY(yc);
    ClickCoordinates a;
    for (int i=0; i<solutions.size (); i++) {
      if (solutions.get(i).clickable(x, y)) {
//        println("TRUE");
        a = solutions.get(i);
//        println(a);
        correct.resize(a.rangeX(), a.rangeY());
        //        fill(255);
        //        rect(a.getX(), a.getY(), a.rangeX(), a.rangeY());
        //        rect(a.getX()-445, a.getY(), a.rangeX(), a.rangeY());
        rectangles.add(a.getX());
        rectangles.add(a.getY());
        rectangles.add(a.rangeX());
        rectangles.add(a.rangeY());
        rectangles.add(a.getX()-445);
        rectangles.add(a.getY());
        rectangles.add(a.rangeX());
        rectangles.add(a.rangeY());
        image(correct, a.getX()-445, a.getY());
        image(correct, a.getX(), a.getY());
        solutions.remove(i);
        return true;
      }
    }
    return false;
  }

  public void setX(int xc) {
    x = xc;
  }
  public void setY(int yc) {
    y = yc;
  }
  public void show() {
    image(picture, (ScreenW/2)-(picture.width/2), (ScreenH/2)-(picture.height/2));
  }

  public void drawRect() {
    int place = 0;
    while (place + 4 <= rectangles.size ()) {
      fill(255);
      noFill();
      stroke(255);
      rect(rectangles.get(place), rectangles.get(place+1), rectangles.get(place+2), rectangles.get(place+3));
      place+=4;
    }
  }

  void clearRect() {
    rectangles.clear();
  }
}

