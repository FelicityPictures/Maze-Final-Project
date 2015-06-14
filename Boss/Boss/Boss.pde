import java.util.*;
import java.io.*;
import java.io.File;

int w;
int h;
int l;
String out;
PImage back;
PImage border;
Ganondorf monster;
Link hero;

void setup() {
  w=1000;
  h=700;
  back = loadImage("Images/Fight Background.jpg");
  back.resize(890, 595);
  border = loadImage("Images/Border.png");
  size(w, h);
  monster = new Ganondorf();
  hero = new Link();
}

void draw() {
  image(back, (w/2)-(back.width/2), (h/2)-(back.height/2));
  image(border, 0, 0);
  fill(255, 255, 255);
  textSize(20);
  out = "You must defeat Ganondorf in order to save the princess";
  l = int(textWidth(out));
  text("You must defeat Ganondorf in order to save the princess", (w/2) - (l/2), 160);
  fill(0, 0, 0);
  rect(60,60,414,54);
  rect(526,60,414,54);
  fill(255,0,0);
  //red health
  rect(67,67,400,40);
  rect(533,67,400,40);
  monster.display(775,350);
  hero.display(150,363);
}

