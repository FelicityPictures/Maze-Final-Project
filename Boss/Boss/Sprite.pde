public class Sprite {
  int x,y,w,h;
  int frames,currentFrame;
  PImage[]images;
  
  Sprite(String path,int xx,int yy, int ww, int hh,int f){
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    frames = f;
    currentFrame = 0;
    images = new PImage[frames];
    for(int i=1;i<frames+1;i++){
      images[i-1]=loadImage(path+" (" + i +").png");
    }
  }
  
  void update(){
  }
  
  void display(){
    image(images[currentFrame],x,y);
    currentFrame = (currentFrame+1)%frames;
    currentFrame++;
    if(currentFrame == frames){
      currentFrame = 0;
    }
  }
}
