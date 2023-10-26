/*
class Gun {
  
  PImage img;
  boolean hasMag;
  boolean hasStock;
  boolean hasSight;
  float xPos;
  float yPos;
  float speed;

  Gun(PImage image, float x, float y, float s, boolean hasMagEquip, boolean hasStockEquip, boolean hasSightEquip) {
    xPos = x;
    yPos = y;
    speed = s;
    hasMag = hasMagEquip;
    hasStock = hasStockEquip;
    hasSight = hasSightEquip;
    img = image;
  }
  
  public void display() {
       image(weapons[0], xPos, yPos, 600, 200);
  }

 public void update() {
    xPos+=speed;
    if(xPos > width) {
     xPos = -200;
    } else if (hasMag){
        image(weapons[2], xPos, yPos, 600, 200);
    } else if (hasStock) {
        image(weapons[1], xPos, yPos, 600, 200);
    }
  }
  
  public void setHasMag() {
    hasMag = !hasMag;
  }
  
  public void setHasStock() {
   hasStock = !hasStock; 
  }

  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};

*/
