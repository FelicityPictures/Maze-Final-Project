import java.util.*;
import java.io.*;

public class Ganondorf extends Player {
  Random r = new Random();
  PImage image;
  //  Sprite idle = new Sprite("Images/Ganondorf/Idle (",200,200,70,70,1);
  //  Sprite dodge = new Sprite("Images/Ganondorf/Dodge",200,200,70,70,1);
  //  Sprite exhausted = new Sprite("Images/Ganondorf/Exhausted",200,200,70,70,1);
  //  Sprite a1 = new Sprite("Images/Ganondorf/Attack 1 (",200,200,70,70,7);
  //  Sprite a2 = new Sprite("Images/Ganondorf/Attack 2 (",200,200,70,70,7);
  //  Sprite a3 = new Sprite("Images/Ganondorf/Attack 3 (",200,200,70,70,7);
  //  Sprite hurt = new Sprite("Images/Ganondorf/Damaged (",200,200,70,70,12);
  //  Sprite sa = new Sprite("Images/Ganondorf/SpecialAttack (",200,200,70,70,9);
  //  Sprite e1 = new Sprite("Images/Ganondorf/Effects 1 (",200,200,70,70,5);
  //  Sprite e2 = new Sprite("Images/Ganondorf/Effects 2 (",200,200,70,70,6);
  //  Sprite se = new Sprite("Images/Ganondorf/Special Effect (",200,200,70,70,6);

  public Ganondorf() {
    super("Ganondorf", 400, 100, 50, 100, 100);
    image = loadImage("Images/Ganondorf/Idle.png");
    image.resize(image.width*4, image.height*4);
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

