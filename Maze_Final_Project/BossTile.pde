public class BossTile extends GameTile {
  PImage Door = loadImage("Images/BossDoor.png");

  public BossTile(GameTile other) {
    super(other.getDirection(), other.puzzle());
  }

  public void PlayerSees() {
    image(Door, 50, 50);
  }

  public void finished(Inventory inv) {
    if (inv.size()==4) {
      //print End Game screen
    }
  }
}

