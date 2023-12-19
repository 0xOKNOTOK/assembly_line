ArrayList<Droid> droidstack = new ArrayList<Droid>(); //<>//
ArrayList<BodyPart> parts = new ArrayList<BodyPart>(); // Create an ArrayList to store all Parts objects.
PImage[] droids = new PImage[8];
PImage[] partsImg = new PImage[3];
PImage gameBackground;
PImage menuBackground;
int numberOfParts = 3; // Sets overall number of parts to be displayed during level.
int score; // Stores the current score of the game, point added per component added to product.
float difficultySpeed = 3; //Sets the speed at which the droid crosses the screen.
boolean mouseStop = false; // Stores the state of the mouse if an item is being selected.
int state = 0; // Global state for the games screens.


class Droid{
  PImage img;
  boolean hasHead;
  boolean hasRightArm;
  boolean hasLeftArm;
  float xPos;
  float yPos;
  float speed;

  Droid(PImage image, float x, float y, float s, boolean hasHeadEquip, boolean hasLeftArmEquip, boolean hasRightArmEquip) {
    xPos = x;
    yPos = y;
    speed = s;
    hasHead = hasHeadEquip;
    hasRightArm = hasRightArmEquip;
    hasLeftArm = hasLeftArmEquip;
    img = image;
  }
  
  public void display() {
       image(droids[0], xPos, yPos, 200, 600);
  }

 public void update() {
   if(hasHead && hasLeftArm && hasRightArm) {
     image(droids[7], xPos, yPos, 200, 600);   
   }else if(hasHead && hasLeftArm) {
     image(droids[2], xPos, yPos, 200, 600);
   } else if (hasHead && hasRightArm) {
     image(droids[3], xPos, yPos, 200, 600);
   } else if (hasLeftArm && hasRightArm) {
     image(droids[6], xPos, yPos, 200, 600);
   }else if (hasLeftArm) {
     image(droids[5], xPos, yPos, 200, 600);
   }else if (hasRightArm) {
     image(droids[4], xPos, yPos, 200, 600);
   }else if (hasHead) {
     image(droids[1], xPos, yPos, 200, 600);
   }
   
   xPos+=speed;
   
    if(xPos > width) {
      if(hasHead == false || hasLeftArm == false || hasRightArm == false) {
        state = 2;
      } else {
       xPos = -200;
       hasHead = false;
       hasLeftArm = false;
       hasRightArm = false;
       spawnParts(0, width, 0, 0, numberOfParts);
       speed = speed + 2;
      }
    }
  }
  
  public void setHasHead() {
    if(!hasHead){
      hasHead = !hasHead;
    }
  }
  
  public void setHasLeftArm() {
    if(!hasLeftArm) {
       hasLeftArm = !hasLeftArm; 
    }
  }
  
    public void setHasRightArm() {
    if(!hasRightArm) {
       hasRightArm = !hasRightArm; 
    }
  }

  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};
class BodyPart { // Decare Parts class. Used to create all component objects.
  
  private float x; // X position of Object.
  private float y; // Y position of Object
  private PImage img; // 
  private String partName;
  
  BodyPart(float xVal, float yVal, PImage part, String partType) { 
    x = xVal;
    y = yVal;
    img = part;
    partName = partType;
  }
  
  public void drop(float speed){ // method for showing the drop speed of the components. 
    y += speed; // Increase Y variable so products fall at a set rate.
  }
  
  public void display() { // Method for rendering the Object on screen.
    image(img, x, y, 80, 150); // Image with name of PImage variable.
  } 
} 

Droid newDroid = new Droid(droids[0], -100, 300, difficultySpeed, false, false, false); // Initialise a new object with class of Droid.

void spawnParts(int xMin, int xMax, int yMin, int yMax, int num) { // Spawn parts randomly at the top of the screen. 
  for(int i = 0; i<num; i++) {
    println(i);
    int x = int(random(xMin, xMax));
    int y = int(random(yMin, yMax));
    if (i == 0) {
      parts.add(new BodyPart(x, y, partsImg[0], "HEAD"));
    } else if (i == 1) {
      parts.add(new BodyPart(x, y, partsImg[1], "ARM_RIGHT"));
    } else if (i == 2) {
      parts.add(new BodyPart(x, y, partsImg[2], "ARM_LEFT"));
    }
  }
}


void setup() {
  size(1280, 720);
  smooth();
  for (int i = 0; i<droids.length; i++) {
    droids[i] = loadImage("droid_" + i + ".png");
  }
  
  
  for (int k = 0; k<partsImg.length; k++) {
    partsImg[k] = loadImage("part_" + k + ".png") ;
  }
  spawnParts(0, width - 200, 0, 0, numberOfParts);

}

void draw() {

  switch(state) {
    case 0:
      menuBackground = loadImage("menuBackground.jpg");
      background(menuBackground);
      textSize(60);
      fill(255, 231, 22);
      text("Droid Builder", width/2 - 170, height/2);
      textSize(40);
      text("Press ENTER key to start!", width/2 - 200, height/2 + 50);
      break;
    case 1:
      gameBackground = loadImage("gameBackground.jpg");
      background(gameBackground);
      moveParts();
      newDroid.display();
      newDroid.update();
      textSize(100);
      text(score, width - 200, 100);
      mouseControl();
      break;
    case 2:
      background(0,0,0);
      textSize(60);
      text("GAME OVER!", width/2 - 200, height/2);
      text("YOU SCORED " + score, width / 2 - 220, height/2 + 70);
      
     default:
       break;
  }
  
}

void keyPressed() {
  if(key == ENTER) state++;
  if(state > 2 ) {
    state=0;
    
  }
}

void moveParts() {
  for (int i = 0; i < parts.size(); i++) {
    parts.get(i).display();
    parts.get(i).drop(1);
  }
}

void mouseControl() {
    
  for (int i = 0; i < parts.size(); i++) {
    if (dist(mouseX, mouseY, parts.get(i).x, parts.get(i).y) < 100) {
      if (mousePressed && (mouseButton==LEFT) && !mouseStop) {
        mouseStop = true;
        parts.get(i).x = mouseX;
        parts.get(i).y = mouseY;
        if (dist(parts.get(i).x, parts.get(i).y, newDroid.getXPos(), newDroid.getYPos() + 100) < 100) {
          score++;
          if (parts.get(i).partName == "HEAD") {
            newDroid.setHasHead();
          } else if (parts.get(i).partName == "ARM_LEFT") {
            newDroid.setHasLeftArm();
          } else if (parts.get(i).partName == "ARM_RIGHT") {
            newDroid.setHasRightArm();
          }
          parts.remove(i);
        }
      } else {
        mouseStop = false;
      }
    }
  }

  
}
