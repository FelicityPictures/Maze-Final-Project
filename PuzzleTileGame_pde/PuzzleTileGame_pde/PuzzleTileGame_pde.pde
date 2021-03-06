import java.util.*;

PImage img, img1;
ArrayList<Integer> pixX = new ArrayList<Integer>();
ArrayList<Integer> pixY = new ArrayList<Integer>();
ArrayList<Integer> emptySpaceX = new ArrayList<Integer>();
ArrayList<Integer> emptySpaceY = new ArrayList<Integer>();
ArrayList<String> cropped = new ArrayList<String>();
int piece = 4;
String[][]cropped2 = new String[piece][piece];
ArrayList<String>answerKey = new ArrayList<String>();

int whereAcross = piece;
int whereDown = piece;
int goW = width/piece;
int goH = height/piece;
boolean start, solved;

void setup() {
  solved = false;
  answerKey = cropped;
  img = loadImage("tilegame.jpg");
  start = true;
  size(1000, 700);

  splitUp(4);
  placeParts(4, 4, 4, 4);
}

void randomize() {
}

void splitUp(int pieces) {
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
        cropped.add("NOTHING");
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
  randomize();
  updateCropped();
}

void updateCropped() {
  int ind1 = 0;
  int ind2 = 0;
  int ind3 = 0;
  while (ind1 < cropped2.length) {
    while (ind2 < cropped2[0].length) {
      cropped2[ind1][ind2] = cropped.get(ind3);
      ind3++;
      ind2++;
    }
    ind1++;
    ind2 = 0;
  }
}

void placeParts(int oldAcross, int oldDown, int across, int down) {
  image(img, 0, 0);
  emptySpaceX.clear();
  emptySpaceY.clear();
  PImage load;
  int tileWidth = img.width/piece;
  int tileHeight = img.height/piece;
  int goWidth = width/piece;
  int goHeight = height/piece;
  int w, h;
  int counterImage = 0;
  int place = 1;
  int place2 = 1;
  int counterW, counterH;
  int cW = 1;
  int cH = 1;
  rect(goWidth, goHeight, img.width, img.height);

  if (!start) {
    switchh(down, across, oldDown, oldAcross);
  }

  while (counterImage < cropped.size ()) {
    if (cropped.get(counterImage).equals("NOTHING")) {
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
      cW++;
    } else {
      load = loadImage(cropped.get(counterImage));
      image(load, goWidth, goHeight);
      goWidth += tileWidth;
      cW++;
    }
    counterImage++;
    if (cW > piece) {
      cW = 1;
      goWidth = width/piece;
      goHeight += tileHeight;
      cH++;
    }
  }
  updateCropped();
  if (cropped.equals(answerKey)) {
    fill(255);
    rect(50, 50, width-100, height-100);
    fill(0, 102, 153);
    textSize(50);
    text("SOLVED!", 400, 400);
    solved = true;
  }
}


private void switchh(int wantBlankR, int wantBlankC, int r2, int c2) {
//  println("R2C2 " + r2 + "," + c2);
  int counter = 0;
  String sub = cropped2[wantBlankR-1][wantBlankC-1];
  //  String sub = "" + wantBlankR + "x" + wantBlankC + ".jpg";
//  println("SUB" + sub);
//  println(cropped);
  counter = cropped.indexOf("NOTHING");
  cropped.remove("NOTHING");
//  println(cropped);

  cropped.add(cropped.indexOf(sub), "NOTHING");
//  println(cropped);

  cropped.remove(sub);
//  println(cropped);

  println(sub);
  cropped.add(counter, sub);
//  println("CR" + cropped);
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

