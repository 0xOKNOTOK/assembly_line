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
       image(weapons[0], xPos, yPos, 600, 200);
  }

 public void update() {
   if(hasMag && hasStock) {
     image(weapons[3], xPos, yPos, 600, 200);
     
   }else if(hasMag) {
     image(weapons[2], xPos, yPos, 600, 200);
     println(hasMag);
   } else if (hasStock) {
     image(weapons[1], xPos, yPos, 600, 200);
   } 
   
   xPos+=speed;
    if(xPos > width) {
     xPos = -200;
    }
  }
  
  public void setHasMag() {
    if(!hasMag){
      hasMag = !hasMag;
    }
  }
  
  public void setHasStock() {
    if(!hasStock) {
       hasStock = !hasStock; 
    }

  }
  
  

  
  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};
