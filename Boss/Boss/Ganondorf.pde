import java.util.*;
import java.io.*;

public class Ganondolf extends Player {
  Random r = new Random();
  PImage[]idle;
  PImage[]a1;
  PImage[]a2;
  PImage[]a3;
  PImage[]hurt;
  PImage[]sa;
  PImage[]die;
  PImage[]e1;
  PImage[]e2;
  PImage[]e3;
  PImage[]se;

  public Ganondolf(String n, int h, int d, int m, int dam, int dex) {
    super("Ganondorf", 400, 100, 50, 100, 100);
    idle = new PImage[3];
    idle[0] = loadImage("Images/Ganondorf/Standing.png");
    idle[1] = loadImage("Images/Ganondorf/Dodged.png");
    idle[2] = loadImage("Images/Ganondorf/Exhausted.png");
    a1 = new PImage[7];
    a2 = new PImage[7];
    a3 = new PImage[3];
    hurt = new PImage[12];
    sa = new PImage[9];
    die = new PImage[];
    e1 = new PImage[];
    e2 = new PImage[];
    e3 = new PImage[];
    se = new PImage[];
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
}

