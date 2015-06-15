import java.util.*;
import java.io.*;

public class Ganondorf extends Player {
  Random r = new Random();
  PImage image;

  public Ganondorf() {
    super("Ganondorf", 350, 55, 50, 100, 100);
    image = loadImage("Images/Ganondorf.png");
    image.resize(int(image.width*.6), int(image.height*.6));
  }

  public void attack(Player other) {
    int a = r.nextInt(7);
    if (a == 0 || a == 3) {
      super.attack1(other);
    }
    if (a == 1 || a==4) {
      super.attack2(other);
    }
    if (a == 2 || a == 5) {
      super.attack3(other);
    }
    if (a == 6) {
      super.specialAttack(other);
    }
  }

  public void display(int x, int y) {
    image(image, x, y);
  }
}

