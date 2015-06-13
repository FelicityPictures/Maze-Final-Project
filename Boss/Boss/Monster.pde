import java.util.*;
import java.io.*;

public class Monster extends Player {
  Random r = new Random();

  public Monster(String n, int h, int d, int m, int dam, int dex, 
  float posx, float posy, int fps) {
    super(n, h, d, m, dam, dex, posx, posy, fps);
  }

  public void attack(Player other) {
    int a = r.nextInt(7);
    if (a == 0 || a == 3) {
      attack1(other);
    }
    if (a == 1 || a==4) {
      attack2(other);
    }
    if (a == 2 || a == 5) {
      attack3(other);
    }
    if (a == 6) {
      specialAttack(other);
    }
  }

}
