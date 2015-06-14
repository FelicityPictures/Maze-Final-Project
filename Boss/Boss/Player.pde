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
    image = loadImage("Images/Ganondorf/Special Effect (5).png");
    image.resize(image.width*3,image.height*3);
  }

  public String getName() {
    return name;
  }
  
  public int getHP(){
    return HP;
  }
  
  public int getMaxHP(){
    return maxHP;
  }
  
  public int getMana(){
    return mana;
  }
  
  public int getMaxMana(){
    return maxMana;
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
  
  public void display(int x,int y){
    image(image,x,y);
  }
}

