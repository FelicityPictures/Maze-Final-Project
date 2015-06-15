import java.util.*;
import java.io.*;
import java.io.File;

int w;
int h;
int l;
int t;
int txtSize;
int widthOfAttackShapes;
int heightOfAttackShapes;
float temp,temp2;
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
  text(out, (w/2) - (l/2), 160);
  fill(0, 0, 0);
  //for red
  rect(60, 60, 410, 50);
  rect(530, 60, 410, 50);
  //for blue
  rect(60, 106, 208, 18);
  rect(732, 106, 208, 18);
  //Zelda
  fill(255, 0, 0);
  temp = 400*hero.getHP()/hero.getMaxHP();
  rect(65, 65, int(temp), 40);
  fill(0, 0, 255);
  temp = 200*hero.getMana()/hero.getMaxMana();
  rect(64, 110, int(temp), 10);
  hero.display(150, 368);
  //Ganondorf
  fill(255, 0, 0);
  temp = 400*(monster.getHP()/monster.getMaxHP());
  temp2 = 535+400-temp;
  rect(int(temp2), 65, int(temp), 40);
  fill(0, 0, 255);
  temp = 735 + (200 - (200*(hero.getMana()/hero.getMaxMana())));
  temp2 = 200*(hero.getMana()/hero.getMaxMana());
  rect(int(temp), 110, int(temp2), 10);
  monster.display(750, 275);
  //display options boxes
  fill(111, 111, 111);
  widthOfAttackShapes = 250;
  heightOfAttackShapes = 50;
  //Special attack
  rect(380, 350, widthOfAttackShapes+20, heightOfAttackShapes);
  //attack 1
  rect(390, 425, widthOfAttackShapes, heightOfAttackShapes);
  //attack 2
  rect(390, 500, widthOfAttackShapes, heightOfAttackShapes);
  //attack 3
  rect(390, 575, widthOfAttackShapes, heightOfAttackShapes);
  //show the words
  fill(0, 0, 102);
  txtSize = 25;
  textSize(txtSize);
  out = "Special Attack";
  l = int(textWidth(out));
  text(out, 515-(l/2), 380+(txtSize/4));
  fill(51, 0, 102);
  out = "Attack 1";
  l = int(textWidth(out));
  text(out, 515-(l/2), 450+(txtSize/3));
  out = "Attack 2";
  l = int(textWidth(out));
  text(out, 515-(l/2), 525+(txtSize/3));
  out = "Attack 3";
  l = int(textWidth(out));
  text(out, 515-(l/2), 600+(txtSize/3));
}

void mouseClicked() {
  println ("" + mouseX + "," + mouseY);
  println("Link HP: " + hero.getHP());
  println("Ganondorf HP: " + monster.getHP());
  println("Link Mana: " + hero.getMana());
  println("Ganondorf Mana: " + monster.getMana());
  //special Attack
  if (mouseX>=380 && mouseX<=650 && mouseY>=350 && mouseY<=400) {
    hero.specialAttack(monster);
    monster.attack(hero);
    println("SA");
  } else {
    if (mouseX>=390 && mouseX<=640) {
      if (mouseY>=425 && mouseY<=475) {
        hero.attack1(monster);
        monster.attack(hero);
        println("A1");
      } else {
        if (mouseY>=500 && mouseY<=550) {
          hero.attack2(monster);
          monster.attack(hero);
          println("A2");
        } else {
          if (mouseY>=575 && mouseY<=625) {
            hero.attack3(monster);
            monster.attack(hero);
            println("A3");
          }
        }
      }
    }
  }
}

