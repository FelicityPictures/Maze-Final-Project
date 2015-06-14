import java.util.*;
import java.io.*;
import java.io.File;

public class Link extends Player {
  //  PImage[]idle;
  //  PImage[] a1;
  //  PImage[] a2;
  //  PImage[] a3;
  //  PImage[] hurt;
  //  PImage[] sa;
  //  PImage[] die;
  //  PImage[] victory;
  PImage image;

  public Link() {
    super("Link", 300, 50, 100, 100, 150);
    image = loadImage("Images/Link a.png");
    image.resize(image.width, image.height);
  }

  public void display(int x, int y) {
    image(image, x, y);
  }
}

