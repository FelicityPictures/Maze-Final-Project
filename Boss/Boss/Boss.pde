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
float temp, temp2;
String out;
PImage back, border1, dead, victory;
Ganondorf monster;
Link hero;
int mode;

void setup() {
  w=1000;
  h=700;
  back = loadImage("Images/Fight Background.jpg");
  back.resize(890, 595);
  border1 = loadImage("Images/Border without map.png");
  size(w, h);
  monster = new Ganondorf();
  hero = new Link();
  mode = 4;
  dead = loadImage("Images/Dead.png");
  dead.resize(dead.width*3, dead.height*3);
  victory = loadImage("Images/Victory.png");
  victory.resize(victory.width*3, victory.height*3);
  temp = -100;
}

void draw() {
  if (mode == 4) {
    image(back, (w/2)-(back.width/2), (h/2)-(back.height/2));
    image(border1,0,0);
    fill(255, 255, 255);
    textSize(20);
    out = "Link (you) must defeat Ganondorf in order to save the princess.";
    l = int(textWidth(out));
    text(out, (w/2) - (l/2), 200);
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
    textSize(20);
    fill(255, 255, 255);
    text(hero.getName(), 70, 150);
    //Ganondorf
    fill(255, 0, 0);
    temp = 400*monster.getHP()/monster.getMaxHP();
    temp2 = 535+(400-temp);
    rect(int(temp2), 65, int(temp), 40);
    fill(0, 0, 255);
    temp = 200*monster.getMana()/monster.getMaxMana();
    temp2 = 736+200-temp;
    rect(int(temp2), 110, int(temp), 10);
    monster.display(750, 275);
    fill(255, 255, 255);
    text(monster.getName(), 930-textWidth(monster.getName()), 150);
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
    temp = 1;
  }
  if (mode == 5) {
    //defeat
    background(0, 0, 0);
    image(dead, (w/2)-(dead.width/2), (h/2)-(dead.height/2)+50);
    textSize(30);
    fill(255, 255, 255);
    out = "You have been defeated by Ganondorf. Try again?";
    temp = textWidth(out);
    text(out, (w/2)-(temp/2), 250);
  }
  if (mode == 6) {
    background(0, 51, 0);
    image(victory, (w/2)-(victory.width/2), (h/2)-(victory.height/2)+50);
    textSize(30);
    fill(255, 255, 255);
    out = "You have defeated Ganondorf. Congratulations!";
    temp = textWidth(out);
    text(out, (w/2)-(temp/2), 250);
    //victory
  }
}

void mouseClicked() {
  //special Attack
  if (mode == 4 && hero.alive() && monster.alive()) {
    if (mouseX>=380 && mouseX<=650 && mouseY>=350 && mouseY<=400) {
      hero.specialAttack(monster);
      //      fill(0, 255, 0);
      //      out = hero.getName() + " used a special attack on " + monster.getName();
      //      text(out, 515-(textWidth(out)/2), 200);
      monster.attack(hero);
    } else {
      if (mouseX>=390 && mouseX<=640) {
        if (mouseY>=425 && mouseY<=475) {
          hero.attack1(monster);
          monster.attack(hero);
        } else {
          if (mouseY>=500 && mouseY<=550) {
            hero.attack2(monster);
            monster.attack(hero);
          } else {
            if (mouseY>=575 && mouseY<=625) {
              hero.attack3(monster);
              monster.attack(hero);
            }
          }
        }
      }
    }
    if (!hero.alive()) {
      //defeat screen
      mode = 5;
    } else {
      if (!monster.alive()) {
        //victory screen
        mode = 6;
      }
    }
  }
  if (mode==5) {
    if (mouseX>=0 && mouseX<=1000 && mouseY>=0 && mouseY<=700 ) {
      hero.reset();
      monster.reset();
      mode = 4;
    }
  }
  //  println ("" + mouseX + "," + mouseY);
  //  println("Link HP: " + hero.getHP());
  //  println("Ganondorf HP: " + monster.getHP());
  //  println("Link Mana: " + hero.getMana());
  //  println("Ganondorf Mana: " + monster.getMana());
}

