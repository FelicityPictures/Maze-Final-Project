public class SpotTheDifference extends Puzzle {
  PImage picture;
  PImage correct;
  int ScreenW, ScreenH;
  ArrayList<String> places = new ArrayList<String>();
  ArrayList<ClickCoordinates>solutions;


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
      solutions.add(new ClickCoordinates(777, 616, 795, 629));
      solutions.add(new ClickCoordinates(501, 449, 568, 528));
      solutions.add(new ClickCoordinates(685, 601, 813, 646));
      solutions.add(new ClickCoordinates(905, 542, 924, 558));
    }
    //picture = loadImage("testImage.jpg");
    ScreenW = w;
    ScreenH = h;
    //set up solutions
  }

  public boolean playable() {
    if (solutions.size()>0) {
      return true;
    } else {
      return false;
    }
  }

  public boolean validClick(int x, int y) {
    for (int i=0; i<solutions.size (); i++) {
      if (solutions.get(i).clickable(x, y)) {
        ClickCoordinates a = solutions.get(i);
        correct.resize(a.rangeX(), a.rangeY())
        image(correct, a.getX(), a.getY());
        solutions.remove(i);
        return true;
      }
    }
    return false;
  }

  public void show() {
    image(picture, (ScreenW/2)-(picture.width/2), (ScreenH/2)-(picture.height/2));
  }
}

