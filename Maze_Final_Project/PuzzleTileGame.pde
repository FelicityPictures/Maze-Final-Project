import java.util.*;

public class PuzzleTileGame extends Puzzle {

  PImage img, img1;
  ArrayList<Integer> pixX = new ArrayList<Integer>();
  ArrayList<Integer> pixY = new ArrayList<Integer>();
  ArrayList<Integer> emptySpaceX = new ArrayList<Integer>();
  ArrayList<Integer> emptySpaceY = new ArrayList<Integer>();
  ArrayList<CropPic> cropped3 = new ArrayList<CropPic>();
  ArrayList<String> cropped = new ArrayList<String>();
  int piece = 3;
  String[][]cropped2 = new String[piece][piece];
  ArrayList<String>answerKey = new ArrayList<String>();

  int whereAcross = piece;
  int whereDown = piece;
  int goW = width/piece;
  int goH = height/piece;
  boolean start, solved;
  boolean setUp = true;
  int x, y;
  Random rand = new Random();
  int numSteps = 0;
  int sub1 = 0;
  int sub2 = 0;

  public PuzzleTileGame(String iName, int pieces) {
    img = loadImage(iName);
    println("constructor");
    piece = pieces;
  }

  void sett() {
    if (setUp) {
      solved = false;
      start = true;
      size(1000, 700);
      splitUp(piece);
      int place = 0;
      int place2 = 0;
      int index = 0;
      println(cropped);
      while (index < cropped2.length) {
        println(Arrays.toString(cropped2[index]));
        index++;
      }
      while (place < cropped2.length) {
        while (place2 < cropped2[0].length) {
          if (cropped2[place][place2].equals("NOTHING")) {
            sub1 = place;
            sub2 = place2;
            place = cropped2.length;
            place2 = cropped2[0].length;
            println(sub1 + " , " + sub2);
          }
          place2++;
        }
        place2 = 0;
        place++;
      }
      whereDown = sub1+1;
      whereAcross = sub2+1;    
      setUp = false;
    }
    placeParts(sub2+1, sub1+1, sub2+1, sub1+1);
  }

  void setX(int xc) {
    x = xc;
  }

  void setY(int yc) {
    y = yc;
  }

  void play(int xc, int yc, boolean changeDir) {
    setX(xc);
    setY(yc);
    if (changeDir) {
      sett();
    }
    mouse();
    println(inversions());
  }

  void randomize() {
    Collections.shuffle(cropped, rand);
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
    int count = 0;
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
          cropped3.add(new CropPic("NOTHING", count));
          count++;
        } else {       
          img1 = img.get(startW, startH, tileWidth, tileHeight);
          img1.save(Integer.toString(place) + "x" + Integer.toString(place2) + ".jpg");
          cropped3.add(new CropPic(Integer.toString(place) + "x" + Integer.toString(place2) + ".jpg", count));
          cropped.add(Integer.toString(place) + "x" + Integer.toString(place2) + ".jpg");
          startW += tileWidth;
          place2++;
          count++;
        }
      }
      place2=1;
      startW = 0;
      startH += tileHeight;
      place++;
    }
    println("a:      " + answerKey);
    int ind = 0;
    while (ind < cropped.size ()) {
      answerKey.add(ind, cropped.get(ind));
      ind++;
    }

    println("b:      " + answerKey);

    randomize();
    if (piece % 2 == 1 && this.inversions() % 2 != 0) {
      while (this.inversions () % 2 != 0) {
        randomize();
      }
    }
    println("c:      " + answerKey);
    updateCropped();
    println("d:      " + answerKey);
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

  public boolean isSolved() {
    return solved;
  }

  void placeParts(int oldAcross, int oldDown, int across, int down) {
 

  image(img, 60, 60);
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
  println("ANSWERKEY" + answerKey);
  if (identical()) {
    fill(255);
    rect(55, 55, width-110, height-110);
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
  println("wantBlankR: " + wantBlankR + "   wantBlankC:  " + wantBlankC);
  //  String sub = "" + wantBlankR + "x" + wantBlankC + ".jpg";
  //  println("SUB" + sub);
  //  println(cropped);
  counter = cropped.indexOf("NOTHING");
  cropped.remove("NOTHING");

  cropped.add(cropped.indexOf(sub), "NOTHING");
  cropped.remove(sub);

  println(sub);
  cropped.add(counter, sub);
  //  println("CR" + cropped);
}


void mouse() {
  //    println("HELEN" + x);
  //    println("HELENY" + y);
  int tileWidth = img.width/piece;
  int tileHeight = img.height/piece;
  int goWidth = width/piece;
  int goHeight = height/piece;

  //did the user click on a valid tile?
  if (onImage(pixX, pixY, x, y) && !onImage(emptySpaceX, emptySpaceY, x, y)) {
    if (onImage(emptySpaceX, emptySpaceY, x + tileWidth, y)) {
      start = false;
      println(1);
      println(whereDown + " , " + whereAcross);
      placeParts(whereAcross, whereDown, whereAcross-1, whereDown);
      whereAcross--;
      numSteps++;
    } else {
      if (onImage(emptySpaceX, emptySpaceY, x - tileWidth, y)) {
        start = false;
        println(2);
        println(whereDown + " , " + whereAcross);
        placeParts(whereAcross, whereDown, whereAcross+1, whereDown);
        whereAcross++;
        numSteps++;
        //move to the right
      } else {
        if (onImage(emptySpaceX, emptySpaceY, x, y + tileHeight)) {
          start = false;
          println(3);
          println(whereDown + " , " + whereAcross);
          placeParts(whereAcross, whereDown, whereAcross, whereDown-1);
          whereDown--;
          numSteps++;
          //move down
        } else {
          if (onImage(emptySpaceX, emptySpaceY, x, y - tileHeight)) {
            start = false;
            println(4);
            println(whereDown + " , " + whereAcross);
            placeParts(whereAcross, whereDown, whereAcross, whereDown+1);
            whereDown++;
            numSteps++;
            //move up
          }
        }
      }
    }
  }
  //    println(cropped);
  //    println("EMPTY:       " + emptySpaceX.get(100) + " , " + emptySpaceY.get(100));
}

private int getPicPlace(int ind) {
  int place = 0;
  String sub = cropped.get(ind);
  while (place < cropped3.size ()) {
    if (cropped3.get(place).getPhoto().equals(sub)) {
      return place;
    }
    place++;
  }
  return place;
}

private int inversions() {
  int place = 0;
  int numInversions = 0;
  int sub = 1;
  int help1 = getPicPlace(place);
  int help2 = getPicPlace(place+sub);

  while (place < cropped.size ()) {
    while (place+sub < cropped.size ()) {    
      help1 = getPicPlace(place);
      help2 = getPicPlace(place+sub);
      if (cropped3.get(help1).getPhoto().equals("NOTHING") || cropped3.get(help2).getPhoto().equals("NOTHING")) {
      } else {
        if (cropped3.get(help1).getPosition() >
          cropped3.get(help2).getPosition()) {
          numInversions++;
        }
      }
      sub++;
    }
    sub = 1;
    place++;
  }
  return numInversions;
}

private boolean identical() {
  int place = 0;
  while (place < cropped.size ()) {
    if (!cropped.get(place).equals(answerKey.get(place))) {
      return false;
    }
    place++;
  }
  return true;
}
}
