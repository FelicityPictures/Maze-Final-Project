public class BossTile extends GameTile {
  PImage Door = loadImage("Image/BossDoor.png");

  public BossTile(GameTile other) {
    super(other.getDirection(), other.getPuzzle());
  }

  public void PlayerSees() {
    image(Door, 0, 0);
  }
}

