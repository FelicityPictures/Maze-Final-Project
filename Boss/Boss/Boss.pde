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
  //for red
  rect(60, 60, 410, 50);
  rect(530, 60, 410, 50);
  //for blue
  rect(60, 106, 208, 18);
  rect(732,106,208,18);
  //Zelda
  fill(255, 0, 0);
  rect(65, 65, 400*(hero.getHP()/hero.getMaxHP()), 40);
  fill(0, 0, 255);
  rect(64, 110, 200*(hero.getMana()/hero.getMaxMana()), 10);
  hero.display(150, 368);
  //Ganondorf
  fill(255, 0, 0);
  rect(535, 65, 400*(monster.getHP()/monster.getMaxHP()), 40);
  fill(0, 0, 255);
  rect(735 + (200 - (200*(hero.getMana()/hero.getMaxMana()))), 110, 200*(hero.getMana()/hero.getMaxMana()), 10);
  monster.display(750, 250);
  //display options
  //attack 1
  //attack 2
  //attack 3
  //special Attack
}

