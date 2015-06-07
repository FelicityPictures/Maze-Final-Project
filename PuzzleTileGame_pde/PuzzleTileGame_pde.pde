import java.util.*;

PImage img, img1;
ArrayList<Integer> pixX = new ArrayList<Integer>();
ArrayList<Integer> pixY = new ArrayList<Integer>();
ArrayList<Integer> emptySpaceX = new ArrayList<Integer>();
ArrayList<Integer> emptySpaceY = new ArrayList<Integer>();
ArrayList<String> cropped = new ArrayList<String>();
int piece = 4;
int whereAcross = piece;
int whereDown = piece;
int goW = width/piece;
int goH = height/piece;
boolean start;

void setup() {
  start = true;
  size(1000, 700);
  img = loadImage("tilegame.jpg");
  splitUp(4);
  placeParts(4, 4, 4, 4);
}


void splitUp(int pieces) {
  image(img, 0, 0);
  piece = pieces;
  int tileWidth = img.width/pieces;
  int tileHeight = img.height/pieces;
  int place = 1;
  int place2 = 1;
  int startW = 0;
  int startH = 0;
  int w, h, counterW, counterH;

  int i = 0;
  int ii = 0;
  while (i <= img.width) {
    while (ii <= img.height) {
      pixX.add(width/piece + i);
      pixY.add(height/piece + ii);
      ii++;
    }
    ii=0;
    i++;
  }

  while (place <= pieces) {
    while (place2 <= pieces) {
      if (place == pieces && place2 == pieces) {
        place2++;
        place++;
      } else {       
        img1 = img.get(startW, startH, tileWidth, tileHeight);
        img1.save(Integer.toString(place) + "x" + Integer.toString(place2) + ".jpg");
        cropped.add(Integer.toString(place) + "x" + Integer.toString(place2) + ".jpg");
        startW += tileWidth;
        place2++;
      }
    }
    place2=1;
    startW = 0;
    startH += tileHeight;
    place++;
  }
}

void placeParts(int oldAcross, int oldDown, int across, int down) {
  emptySpaceX.clear();
  emptySpaceY.clear();
  PImage load;
  whereAcross = across;
  whereDown = down;
  int tileWidth = img.width/piece;
  int tileHeight = img.height/piece;
  int goWidth = width/piece;
  int goHeight = height/piece;
  int w, h;
  int counterImage = 0;
  int place = 1;
  int place2 = 1;
  int counterW, counterH;
  rect(goWidth, goHeight, img.width, img.height);

  if (!start) {
    switchh(whereAcross, whereDown, oldAcross, oldDown);
  }

  while (place <= piece) {
    while (place2 <= piece) {
      if (place2 == whereAcross && place == whereDown) {     
        w = goWidth;
        h = goHeight;
        counterW = 0;
        counterH = 0;
        while (counterW <= tileWidth) {
          //empty? add to emptySpace
          while (counterH <= tileHeight) {
            emptySpaceX.add(w + counterW);
            emptySpaceY.add(h + counterH);
            counterH++;
          }
          counterH = 0;
          counterW++;
        }
        goWidth+= tileWidth;
        place2++;
      } else {

        //load each cropped image
        println("counter" + counterImage);
        load = loadImage(cropped.get(counterImage));
        image(load, goWidth, goHeight);

        goWidth += tileWidth;
        place2++;
        counterImage++;
      }
    }
    place2=1;
    goWidth = width/piece;
    goHeight += tileHeight;
    place++;
  }
  println(cropped);
}


private void switchh(int wantBlankR, int wantBlankC, int r2, int c2) {
  int place = 1;
  int place2 = 1;
  int counter = 0;
  int counter2 = 0;
  String sub = "";

  while (place <= piece) {
    while (place2 <= piece) {
      if (place == wantBlankR && place2 == wantBlankC) {
        sub = cropped.remove(counter);
      } else {
        if (place == r2 && place2 == c2) {
          counter2 = counter;
        }
        counter++;
      }
      place2++;
    }
    place2 = 1;
    place++;
  }
  cropped.add(counter2, sub);
  println(cropped);
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

void mouseClicked() {  
  println("CROPPED" + cropped);
  int tileWidth = img.width/piece;
  int tileHeight = img.height/piece;
  int goWidth = width/piece;
  int goHeight = height/piece;
  println (mouseX +"," + mouseY);

  //did the user click on a valid tile?
  if (onImage(pixX, pixY, mouseX, mouseY) && !onImage(emptySpaceX, emptySpaceY, mouseX, mouseY)) {
    println(0);
    if (onImage(emptySpaceX, emptySpaceY, mouseX + tileWidth, mouseY)) {
      start = false;
      println(1);
      placeParts(whereAcross, whereDown, whereAcross-1, whereDown);
      whereAcross--;
    } else {
      if (onImage(emptySpaceX, emptySpaceY, mouseX - tileWidth, mouseY)) {
        start = false;
        println(2);
        placeParts(whereAcross, whereDown, whereAcross+1, whereDown);
        whereAcross++;
        //move to the right
      } else {
        if (onImage(emptySpaceX, emptySpaceY, mouseX, mouseY + tileHeight)) {
          start = false;
          println(3);
          placeParts(whereAcross, whereDown, whereAcross, whereDown-1);
          whereDown--;
          //move down
        } else {
          if (onImage(emptySpaceX, emptySpaceY, mouseX, mouseY - tileHeight)) {
            start = false;
            println(4);
            placeParts(whereAcross, whereDown, whereAcross, whereDown+1);
            whereDown++;
            //move up
          }
        }
      }
    }
  }
}

void draw() {
}


//void draw() {
//  int tileWidth = img.width/4;
//  int tileHeight = img.height/4;
//  int goWidth = width/4;
//  int goHeight = height/4;
//  rect(width/4, height/4, img.width, img.height);
//  image(img, 0, 0);
//  copy(0, 0, tileWidth, tileWidth, goWidth, goHeight, tileWidth, tileHeight);
//  copy(tileWidth, tileHeight, tileWidth, tileHeight, goWidth+tileWidth, goHeight+tileHeight, tileWidth, tileHeight);
//}

