import java.util.*;
import java.io.*;

public class abstract Player {
  String name;
  int HP;
  int defense;
  int mana;
  int damage;
  int dexterity;
  Random r = new Random();

  public Player(String n, int h, int d, int m, int dam, int dex) {
    name = n;
    HP = h;
    defense = d;
    mana = m;
    damage = dam;
    dexterity = dex;
  }

  public String getName() {
    return name;
  }

  public void damaged(int rawDamageFromOtherPlayer) {
    HP = HP - (rawDamageFromOtherPlayer-(r.nextInt(defense/2)+(defense/4)));
  }

  public boolean specialAttack(Player other) {
    if (mana >= 10) {
      if (r.nextInt(dexterity)>dexterity/4) {
        int d = r.nextInt(damage) + ((damage*3)/4);
        other.damaged(damage*2);
        return true;
      }
      mana = mana-10;
    }
    return false;
  }

  public boolean attack1(Player other) {
    if (r.nextInt(dexterity) > dexterity/3) {
      other.damaged(r.nextInt(damage)+damage/3);
      return true;
    }
    return false;
  }

  public boolean attack2(Player other) {
    if (r.nextInt(dexterity) > dexterity/3) {
      other.damaged(r.nextInt(damage)+damage/3);
      return true;
    }
    return false;
  }

  public boolean attack3(Player other) {
    if (r.nextInt(dexterity) > dexterity/3) {
      other.damaged(r.nextInt(damage)+damage/3);
      return true;
    }
    return false;
  }

  public boolean alive() {
    if (HP>0) {
      return true;
    }
    return false;
  }
}

