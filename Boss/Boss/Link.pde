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
    image = loadImage("Images/Link.png");
    image.resize(int(image.width*1.5), int(image.height*1.5));
  }

  public void display(int x, int y) {
    image(image, x, y);
  }
}

