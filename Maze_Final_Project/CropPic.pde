import java.util.*;

public class CropPic {
  String photo = "";
  int position = 0;

  public CropPic(String name, int pos) {
    photo = name;
    position = pos;
  }

  public String getPhoto() {
    return photo;
  }

  public int getPosition() {
    return position;
  }
  
  public String toString(){
    return "" + getPhoto() + " , " + Integer.toString(getPosition());
  }
}

