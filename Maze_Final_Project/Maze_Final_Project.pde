import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//click 'P' to start playing

import java.util.*;
import java.io.*;
import java.io.File;
import ddf.minim.*;

Random r;
GameTile[][] map;
int w, h, currentRow, currentCol, numberOfDoors, mx, my, startx, starty, endx, endy;
int l, t, txtSize, widthOfAttackShapes, heightOfAttackShapes;
GameTile current;
int mode = 0;
boolean seeMap = false;
ArrayList<Integer> mapImage = new ArrayList<Integer>();
PImage border, back, border1, dead, victory, startScreen, settings;
boolean changeDir = false;
float temp, temp2;
String out;
Ganondorf monster;
Link hero;
//AudioPlayer player;
//Minim minim;

void setup() {
  w=1000;
  h=700;
  numberOfDoors = 4;
  size(w, h);
  int mode = 0;
  border = loadImage("Images/Border.png");
  settings = loadImage("Images/Settings.png");
  background(0);
  r = new Random();
  int filenumber = r.nextInt(3);
  startScreen = loadImage("Images/Start Menu.png");
  //  minim = new Minim(this);
  //  player = minim.loadFile("Images/Quiet Slumber.mp3",2043);
  //  player.play();
  //use random to determine which game file to use

    String[] lines = loadStrings("TestMaze.txt");
  map = new GameTile[Integer.parseInt(lines[0])][Integer.parseInt(lines[1])];
  startx = Integer.parseInt(lines[2]);
  starty = Integer.parseInt(lines[3]);
  endx = Integer.parseInt(lines[4]);
  endy = Integer.parseInt(lines[5]);
  currentCol =  startx;
  currentRow = starty;
  String sub = "";
  for (int i=0; i<map.length; i++) {
    sub = lines[6+i];
    for (int ii=0; ii<map[0].length; ii++) {    
      map[i][ii]= new GameTile(sub.charAt(ii), false);
    }
  }

  int puzzleX, puzzleY;
  for (int i=0; i<numberOfDoors; i++) {
    puzzleX = r.nextInt(map.length);
    puzzleY = r.nextInt(map[0].length);
    if (map[puzzleX][puzzleY].getDirection()!='#' && (puzzleX!=startx || puzzleY!=starty) &&
      (puzzleX!=endx || puzzleY !=endy) && !map[puzzleX][puzzleY].puzzle()) {
      map[puzzleX][puzzleY]=new GameTile(map[puzzleX][puzzleY]);
      println(puzzleX + " , " + puzzleY);
      println(map[puzzleX][puzzleY]);
    } else {
      i--;
    }
  }

  map[endx][endy]= new BossTile(map[endx][endy]);
  current = map[startx][starty];
  displayDefault();

  int mapx = 924;
  int mapy = 624;
  int i = -80;
  int ii = -80;
  while (i <= 80) {
    while (ii <= 80) {
      mapImage.add(mapx+i);
      mapImage.add(mapy+ii);
      ii++;
    }
    i++;
    ii = -80;
  }
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

static boolean inArray(ArrayList<Integer> xc, int x, int y) {
  int place = 0;
  while (place < xc.size ()) {
    if (xc.get(place) == x && xc.get(place+1) == y) {
      return true;
    }
    place++;
  }
  return false;
}

static boolean onImage(ArrayList<Integer> xc, ArrayList<Integer> yc, int x, int y) {
  int place = 0;
  while (place < xc.size ()) {
    if (xc.get(place) == x && yc.get(place) == y) {
      return true;
    }
    place++;
  }
  return false;
}

void displayDefault() {
  image(startScreen, 0, 0);
  textSize(50);
  fill(46, 0, 125);
  out = "Press P to begin the game.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150);
  fill(221, 117, 253);
  out = "Press S to find out how to play.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 650);
  //  background(0);
  //  image(border, 0, 0);
  // fill (150, 150, 150, 80);
  // rect(100, 100, width-200, height-200);
}

void displaySettings() {
  image(settings, 0, 0);
  textSize(30);
  fill(232, 30, 30);
  int i = 0;
  out = "Traverse the maze using your keyboard.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150+50*i);
  i++;
  out = "You may use the minimap to guild you.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150+50*i);
  i++;
  out = "Solve the puzzles you encounter throughout the maze.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150+50*i);
  i++;
  out = "At the center of the maze is the door to your opponent.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150+50*i);
  i++;
  out = "If you wish to beat this game, you must defeat him.";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 150+50*i);
  i++;
  out = "Click the screen to begin the game. Good luck!";
  txtSize = int(textWidth(out));
  text(out, (w/2)-(txtSize/2), 600);
}

void loadArrows(GameTile g) {
}

void keyPressed() {
  println(keyCode);
  if (mode == 0) {
    if (keyCode == 'P') {
      mode = 1;
    } else {
      if (keyCode == 'S') {
        mode = 2;
      }
    }
  } else {
    if (mode == 1) {
      if (keyCode==38 && current.ValidClick('N')) {
        //go north
        currentRow--;
        current = map[currentRow][currentCol];
        changeDir = true;
      } else {
        if (keyCode==37 && current.ValidClick('W')) {
          //go west
          currentCol--;
          current = map[currentRow][currentCol];
          changeDir = true;
        } else {
          if (keyCode==39 && current.ValidClick('E')) {
            //go east
            currentCol++;
            current = map[currentRow][currentCol];
            changeDir = true;
          } else {
            if (keyCode==40 && current.ValidClick('S')) {
              //go south
              currentRow++;
              current = map[currentRow][currentCol];
              changeDir = true;
            }
          }
        }
      }
    }
    if (currentRow == endx && currentCol == endy) {
      mode = 4;
    }
  }
}

void mouseClicked() {
  println ("" + mouseX + "," + mouseY);
  if (mode==5) {
    if (mouseX>=0 && mouseX<=1000 && mouseY>=0 && mouseY<=700 ) {
      hero.reset();
      monster.reset();
      mode = 10;
    }
  }
  if (mode == 2 && mouseX>0 && mouseX<1000 && mouseY>0 && mouseY<700) {
    mode = 1;
  }
  if (mode == 1) {
    if (!current.puzzle()) {
      if (mouseX>=849 && mouseX<=1000 && mouseY>=553 && mouseY<=700) {
        seeMap = !seeMap;
      }
      if (mouseX>=821 && mouseX<=852 && mouseY>=637 && mouseY<=695) {
        mode = 2;
      }
    } else {
      if (current.getIsPuzzleTile()) {
        current.setX(mouseX);
        current.setY(mouseY);
        mx = mouseX;
        my = mouseY;
      }
    }
  }
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
  if(mode == 10){
    mode = 4;
  }
}


void draw() {
  //  println("mode" + mode);
  if (mode == 0) {
    displayDefault();
  } else {
    if (mode == 1) {
      if (currentCol == endy && currentRow == endx) {
        current.PlayerSees(mx, my, changeDir, true);
      } else {
        current.PlayerSees(mx, my, changeDir, false);
      }
      if (changeDir) {
        changeDir = !changeDir;
      }
      if (!current.puzzle()) {
        image(border, 0, 0);
      }

      //   println(currentRow + "," + currentCol);
      if (current.puzzle() && current.getIsPuzzleTile()) {
        //        current.PlayerSees(mx, my, changeDir, false);
        //        image(border, 0, 0);
        textSize(32);
        fill(255);
        text(("NUMBER OF STEPS TAKEN SO FAR: ______ "), 50, 30);
        text("Slide the puzzle tiles to create the image you see on the left. The missing tile should be the lower right hand tile. \n Good Luck!", 500, 30);
      }
    } else {
      if (mode == 4) {
        image(back, (w/2)-(back.width/2), (h/2)-(back.height/2));
        image(border1, 0, 0);
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
      if (mode == 2) {
        displaySettings();
      }
    }
  } 
  if (seeMap) {
    //    fill(218, 218, 231, 20);
    //    rect(100, 100, width-200, height-200);
    int xx = (w/2)-(map.length*54/2);
    int yy = (h/2)-(map[0].length*54/2);
    for (int i=0; i<map[0].length; i++) {
      for (int m=0; m<map.length; m++) {
        map[m][i].MapDisplay(xx+i*54, yy+m*54);//(xx+i*54, yy+m*54);
      }
    }
    PImage here = loadImage("Images/CurrentDot.png");
    image(here, xx+(currentCol*54), yy+(currentRow*54));
  }

  //  displayMap();
  //image(West,200,200);
  //  PuzzleTileGame t = new PuzzleTileGame();
}

