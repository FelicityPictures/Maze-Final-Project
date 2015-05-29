public class SpotTheDifference extends Puzzle{
  PImage picture;
  int ScreenW, ScreenH;
  ClickCoordinates[]solutions;


  public SpotTheDifference(int i, int w, int h) {
    super();
    //if statement for loading images
    picture = loadImage("testImage.jpg");
    ScreenW = w;
    ScreenH = h;
    //set up solutions
  }

  public void play() {
    show();
    //number of solutions
    //if statements that would print out the puzzle
  }

  public void show() {
    image(picture, (ScreenW/2)-(picture.width/2), (ScreenH/2)-(picture.height/2));
  }
}

