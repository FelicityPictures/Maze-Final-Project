public abstract class Player {
  private String name;
  private int HP;
  private int defense;
  private int mana;
  private int damage;

  public Player(String n, int h, int d, int m, int dam) {
    name = n;
    HP = h;
    defense = d;
    mana = m;
    damage = dam;
  }

  public String getName() {
    return name;
  }

  public boolean specialAttack() {
    if (mana > 10) {
      return true;
    }
    return false;
  }


}

