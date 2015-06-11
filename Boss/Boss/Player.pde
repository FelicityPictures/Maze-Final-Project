import java.util.*;
import java.io.*;

public abstract class Player{
  private String name;
  private int HP;
  private int defense;
  private int mana;
  private int damage;
  private int dexterity;
  Random r;
  
  public Player(String n,int h,int d,int m,int dam,int dex){
    name = n;
    HP = h;
    defense = d;
    mana = m;
    damage = dam;
    dexterity = dex;
  }
  
  public String getName(){
    return name;
  }
  
  public void damaged(int rawDamageFromOtherPlayer){
    HP = HP - (rawDamageFromOtherPlayer-(r.nextInt(defense/2)+(defense/4)));
  }
  
  public boolean specialAttack(Player other){
    if(mana > 10){
      other.damaged(damage*2.5);
      return true;
    }
    return false;
  }
  
  public boolean attack1(Player other){
    if(r.nextInt(100) > dex){
      other.damaged(damage);
      return true;
    }
    return false;
  }
  
  public boolean attack2(Player other){
    if(mana > 10){
      other.damaged(damage);
      return true;
    }
    return false;
  }
  
  public boolean attack3(Player other){
    if(mana > 10){
      other.damaged(damage);
      return true;
    }
    return false;
  }
  
}
