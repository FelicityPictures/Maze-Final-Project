import java.util.*;


PImage img;
ArrayList<Integer> pix = new ArrayList<Integer>();

void setup() {
  size(1000, 700);
  img = loadImage("tilegame.jpg");
  splitUp(4);
}

void splitUp(int pieces) {
  int tileWidth = img.width/pieces;
  int tileHeight = img.height/pieces;
  int goWidth = width/4;
  int goHeight = height/4;
  rect(goWidth, goHeight, img.width, img.height);
  int place = 1;
  int place2 = 1;
  image(img, 0, 0);
  int startW = 0;
  int startH = 0;
  int placeW = goWidth;
  int placeH = goHeight;
  int w, h, counterW, counterH;
  while (place <= pieces) {
    while (place2 <= pieces) {
      if (place == pieces && place2 == pieces) {
        place++;
        place2++;
      } else {
        copy(startW, startH, tileWidth, tileHeight, placeW, placeH, tileWidth, tileHeight);
        w = placeW;
        h = placeH;
        counterW = 0;
        counterH = 0;
        while (counterW <= tileWidth) {
          while (counterH <= tileHeight) {
            pix.add(w + counterW);
            pix.add(h + counterH);
            counterH++;
          }
          counterH = 0;
          counterW++;
        }
        startW += tileWidth;
        placeW += tileWidth;
        place2++;
      }
    }
    place2=1;
    startW = 0;
    placeW = goWidth;
    startH += tileHeight;
    placeH += tileHeight;
    place++;
  }
  println(pix);
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

