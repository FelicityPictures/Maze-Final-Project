import java.util.*;
import java.io.*;

public class Player {
  String name;
  int HP;
  int defense;
  int mana;
  int damage;
  int dexterity;
  Random r = new Random();
  float x, y;
  float index = 0;
  float speed;
  int fps;
  PImage[]images;
  boolean playing = false;
  boolean playOnce = true;

  public Player(String n, int h, int d, int m, int dam, int dex, 
  float posx, float posy, int fps) {
    name = n;
    HP = h;
    defense = d;
    mana = m;
    damage = dam;
    dexterity = dex;
    x = posx;
    y = posy;
    this.fps = fps;
    index = 0;
    setFPS(fps);
  }
  void loadImagesFromPath(String path) {
    java.io.File folder = new java.io.File(dataPath(path));
    String[] filenames = folder.list();
    images = new PImage[filenames.length];

    for (int i = 0; i < filenames.length; i++) {
      images[i] = loadImage(dataPath(path + "/" + filenames[i]));
    }
  }

  void setFPS(int fps) {
    this.fps = fps;
  }

  void setSpeed(int fps) {
    speed = fps/(float)frameRate;
  }

  void playOnce() {
    index = 0;
    playOnce = true;
    playing = true;
  }

  void loop() {
    playing = true;
    playOnce = false;
  }

  void stop() {
    playing = false;
    playOnce = false;
  }

  boolean isPlaying() {
    return playing;
  }

  void draw() {
    // We must convert the float index to an int first!
    int imageIndex = int(index);
    image(images[imageIndex], x, y);
  }

  void update() {
    setSpeed(fps);

    if (playing) {
      // Move the index forward in the animation sequence
      index += speed;
      // If we are at the end, go back to the beginning

      if (index >= images.length) {
        if (playOnce) {
          playing = false;
          index = images.length-1;
        } else {

          // We could just say index = 0
          // but this is slightly more accurate
          index -= images.length;
        }
      }
    }
  }

  public String getName() {
    return name;
  }

  public void damaged(int rawDamageFromOtherPlayer) {
    HP = HP - (rawDamageFromOtherPlayer-(r.nextInt(defense/2)+(defense/4)));
  }

  public boolean specialAttack(Player other) {
    if (mana >= 10 &&  r.nextInt(dexterity)>dexterity/4) {
      int d = r.nextInt(damage) + ((damage*3)/4);
      other.damaged(damage*2);
      return true;
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
}

