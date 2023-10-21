class Kolashnikov{
  PImage img;
  boolean hasMag;
  boolean hasStock;
  float xPos;
  float yPos;
  float speed;

  Kolashnikov(PImage image, float x, float y, float s, boolean hasMagEquip, boolean hasStockEquip) {
    xPos = x;
    yPos = y;
    speed = s;
    hasMag = hasMagEquip;
    hasStock = hasStockEquip;
    img = image;
  }
  
  public void display() {
      if (hasMag == false){
        image(weapons[0], xPos, yPos, 600, 200);
      } if (hasStock == true){
        image(weapons[1], xPos, yPos, 600, 200);
        
      }
      
      else {
        image(weapons[2], xPos, yPos, 600, 200);
      }
  }

  public void update() {
    xPos+=speed;
    if(xPos > width) {
     xPos = -200; 
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
