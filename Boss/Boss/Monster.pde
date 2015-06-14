import java.util.*;
import java.io.*;

public class Ganondorf extends Player {
  Random r = new Random();
  PImage[]a1;
  PImage[]a2;
  PImage[]a3;
  PImage[]hurt;
  PImage[]sa;
  PImage[]die;

  public Monster(String n, int h, int d, int m, int dam, int dex) {
    super("Ganondorf",400,100,50,100,100);
    
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

