import java.util.*;
import java.io.*;
import java.io.File;

public class Link extends Player {
  PImage[]idle;
  PImage[] a1;
  PImage[] a2;
  PImage[] a3;
  PImage[] hurt;
  PImage[] sa;
  PImage[] die;
  PImage[] victory;

  public Link() {
    super("Link", 300, 50, 100, 100, 150);
    idle = new PImage[2];
    idle[0]=loadImage("Images/Link/Standing.png");
    idle[1]=loadImage("Images/Link/Shield.png");
    a1 = new PImage[6];
    a2 = new PImage[6];
    a3 = new PImage[6];
    hurt = new PImage[11];
    sa = new PImage[4];
    die = new PImage[7];
    victory = new PImage[2];
    for (int i = 1; i<7; i++) {
      a1[i-1]=loadImage("Images/Link/Attack 1("+i+").png");
    }
    for (int i = 1; i<7; i++) {
      a1[i-1]=loadImage("Images/Link/Attack 2("+i+").png");
    }
    for (int i = 1; i<7; i++) {
      a1[i-1]=loadImage("Images/Link/Attack 3("+i+").png");
    }
    for (int i = 1; i<12; i++) {
      a1[i-1]=loadImage("Images/Link/Damaged("+i+").png");
    }
    for (int i = 1; i<5; i++) {
      a1[i-1]=loadImage("Images/Link/Special Attack("+i+").png");
    }
    for (int i = 1; i<8; i++) {
      a1[i-1]=loadImage("Images/Link/Dead("+i+").png");
    }
    for (int i = 1; i<3; i++) {
      a1[i-1]=loadImage("Images/Link/Victory("+i+").png");
    }
  }
}

