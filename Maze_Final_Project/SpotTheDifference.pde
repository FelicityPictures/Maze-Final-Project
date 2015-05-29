public class SpotTheDifference {
  PImage picture;
  int Screenw, Screenh;
  ClickCoordinates[]solutions;


  public SpotTheDifference(int i, int w, int h) {
    //if statement for loading images
    picture = loadImage("testImage.jpg");
    Screenw = w;
    Screenh = h;
    //set up solutions
  }

  public void play(int positionx, int positiony) {
    show();
    //number of solutions
    //if statements that would print out the puzzle
  }

  public void show() {
    image(picture, (Screenw/2)-(picture.width/2), (Screenh/2)-(picture.height/2));
  }
}

