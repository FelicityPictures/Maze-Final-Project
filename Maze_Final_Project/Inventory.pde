public class Inventory {
  ArrayList<Item>inv;

  public Inventory() {
    inv = new ArrayList<Item>();
  }

  public void foundNew(Item t) {
    inv.add(t);
  }

  public int size() {
    return inv.size();
  }
}

