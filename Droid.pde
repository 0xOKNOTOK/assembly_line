class Droid{
  PImage img;
  boolean hasHead;
  boolean hasBlaster;
  float xPos;
  float yPos;
  float speed;

  Droid(PImage image, float x, float y, float s, boolean hasHeadEquip, boolean hasBlasterEquip) {
    xPos = x;
    yPos = y;
    speed = s;
    hasHead = hasHeadEquip;
    hasBlaster = hasBlasterEquip;
    img = image;
  }
  
  public void display() {
       image(droids[0], xPos, yPos, 600, 200);
  }

 public void update() {
   if(hasHead && hasBlaster) {
     image(droids[3], xPos, yPos, 600, 200);
     
   }else if(hasHead) {
     image(droids[2], xPos, yPos, 600, 200);
     println(hasHead);
   } else if (hasBlaster) {
     image(droids[1], xPos, yPos, 600, 200);
   } 
   
   xPos+=speed;
   
    if(xPos > width) {
     xPos = -200;
     hasHead = false;
     hasBlaster = false;
    }
  }
  
  public void setHasHead() {
    if(!hasHead){
      hasHead = !hasHead;
    }
  }
  
  public void setHasBlaster() {
    if(!hasBlaster) {
       hasBlaster = !hasBlaster; 
    }

  }
  
  

  
  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};
