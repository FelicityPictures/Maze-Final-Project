public class SpotTheDifference {
  PImage picture;
  int Screenw, Screenh;
  //ClickCoordinates[]solutions;


  public SpotTheDifference(int i, int w, int h) {
    picture = loadImage("testImage.jpg");
    Screenw = w;
    Screenh = h;
  }

  public void setup() {
    //if statements for setting up solutions
  }

  public void play(int positionx, int positiony) {
    //if statements that would print out the puzzle
  }

  public void print() {
    image(picture, (Screenw/2)-(picture.width/2), (Screenh/2)-(picture.height/2));
  }
}

