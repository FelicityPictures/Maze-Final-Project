public class BossTile extends GameTile{
  PImage Door = loadImage("Image/BossDoor.png");
  
  public BossTile(char d, boolean dr) {
    super(d,dr);
  }
  
  public void PlayerSees(){
    image(Door,0,0);
  }
  
}
