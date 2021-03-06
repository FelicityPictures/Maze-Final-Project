import java.util.*;
import java.io.*;

public class Player {
  String name;
  int HP;
  int defense;
  int mana;
  int damage;
  int dexterity;
  PImage image;
  int maxHP;
  int maxMana;
  int temp;
  Random r = new Random();

  public Player(String n, int h, int d, int m, int dam, int dex) {
    name = n;
    HP = h;
    maxHP = h;
    defense = d;
    mana = m;
    maxMana = m;
    damage = dam;
    dexterity = dex;
    image = loadImage("Images/Link a.png");
    image.resize(image.width*3, image.height*3);
  }

  public String getName() {
    return name;
  }

  public int getHP() {
    return HP;
  }

  public int getMaxHP() {
    return maxHP;
  }

  public int getMana() {
    return mana;
  }

  public int getMaxMana() {
    return maxMana;
  }

  public void reset() {
    HP = maxHP;
    mana = maxMana;
  }

  public void damaged(int rawDamageFromOtherPlayer) {
    temp = r.nextInt(defense/2)+(defense/3);
    if (temp>=rawDamageFromOtherPlayer) {
      temp = rawDamageFromOtherPlayer/4;
    }
    HP = HP - (rawDamageFromOtherPlayer-temp);
    if (HP<0) {
      HP = 0;
    }
  }

  public boolean specialAttack(Player other) {
    if (alive()) {
      if (mana >= 10) {
        if (r.nextInt(dexterity)<dexterity/2) {
          int d = r.nextInt(damage) + ((damage*3)/4);
          other.damaged(damage);
          mana = mana-10;
          return true;
        } else {
          mana = mana-10;
          return false;
        }
      }
    }
    return false;
  }

  public boolean attack1(Player other) {
    if (alive()) {
      if (r.nextInt(dexterity) < dexterity/3) {
        other.damaged(r.nextInt(damage)+damage/3);
        return true;
      }
    }
    return false;
  }

  public boolean attack2(Player other) {
    if (alive()) {
      if (r.nextInt(dexterity) < dexterity/3) {
        other.damaged(r.nextInt(damage)+damage/3);
        return true;
      }
    }
    return false;
  }

  public boolean attack3(Player other) {
    if (alive()) {
      if (r.nextInt(dexterity) < dexterity/3) {
        other.damaged(r.nextInt(damage)+damage/3);
        return true;
      }
    }
    return false;
  }

  public boolean alive() {
    if (HP>0) {
      return true;
    }
    return false;
  }

  public void display(int x, int y) {
    image(image, x, y);
  }
}

