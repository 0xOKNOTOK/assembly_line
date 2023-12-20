ArrayList<Droid> droidstack = new ArrayList<Droid>(); // Array for objects of the droid stack. //<>//
ArrayList<BodyPart> parts = new ArrayList<BodyPart>(); // Create an ArrayList to store all Parts objects.
PImage[] droids = new PImage[8]; // Array of processing image objects.
PImage[] partsImg = new PImage[3]; // Array of processing image objects.
PImage gameBackground; // Empty processing image object
PImage menuBackground; // Empty processing image object
int numberOfParts = 3; // Sets overall number of parts to be displayed during level.
int score; // Stores the current score of the game, point added per component added to product.
float difficultySpeed = 3; //Sets the speed at which the droid crosses the screen.
boolean mouseStop = false; // Stores the state of the mouse if an item is being selected.
int state = 0; // Global state for the games screens.


class Droid{ // Class created for Droid that moves across screen
  PImage img; // Properties of a droid class.
  boolean hasHead;
  boolean hasRightArm;
  boolean hasLeftArm;
  float xPos;
  float yPos;
  float speed;

  Droid(PImage image, float x, float y, float s, boolean hasHeadEquip, boolean hasLeftArmEquip, boolean hasRightArmEquip) { // Constructor for droid objects.
    xPos = x; // Assign properties passed during creation of new object to properties of the droid class.
    yPos = y;
    speed = s;
    hasHead = hasHeadEquip;
    hasRightArm = hasRightArmEquip;
    hasLeftArm = hasLeftArmEquip;
    img = image;
  }
  
  public void display() { // Method for displaying the droid on the screen. 
       image(droids[0], xPos, yPos, 200, 600); 
  }

 public void update() { // Method for updating the droid on the screen subject to conditions. 
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
   
   xPos+=speed; // Moves droid across the screen by the speed declared by the games difficulty level.
   
    if(xPos > width) { // If the xpos goes beyond the width the droid has left the screen.
      if(hasHead == false || hasLeftArm == false || hasRightArm == false) { // If any parts are missing set the state to game over.
        state = 2;
      } else { // Reset droid and reset parts and increment speed.
       xPos = -200;
       hasHead = false;
       hasLeftArm = false;
       hasRightArm = false;
       spawnParts(0, width, 0, 0, numberOfParts);
       speed = speed + 2;
       
      }
    }
  }
  
  public void setHasHead() { // Boolean flip for each part.
    if(!hasHead){
      hasHead = !hasHead;
    }
  }
  
  public void setHasLeftArm() { // Boolean flip for each part.
    if(!hasLeftArm) {
       hasLeftArm = !hasLeftArm; 
    }
  }
  
    public void setHasRightArm() { // Boolean flip for each part.
    if(!hasRightArm) {
       hasRightArm = !hasRightArm; 
    }
  }

  public float getXPos() { // Gives current xPos 
    return xPos;
  }
  public float getYPos() { // Gives current yPos.
    return yPos;
  }
  
};
class BodyPart { // Decare Parts class. Used to create all component objects.
  
  private float x; // X position of Object.
  private float y; // Y position of Object
  private PImage img; // 
  private String partName;
  
  BodyPart(float xVal, float yVal, PImage part, String partType) {  // BodyPart class constructor.
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
  for(int i = 0; i<num; i++) { // Loop through number of parts.
    int x = int(random(xMin, xMax)); // Spawn parts randomly along the x and y axis.
    int y = int(random(yMin, yMax));
    if (i == 0) {
      parts.add(new BodyPart(x, y, partsImg[0], "HEAD")); // Add one of each part type.
    } else if (i == 1) {
      parts.add(new BodyPart(x, y, partsImg[1], "ARM_RIGHT"));
    } else if (i == 2) {
      parts.add(new BodyPart(x, y, partsImg[2], "ARM_LEFT"));
    }
  }
}


void setup() {
  size(1280, 720); // Sets resolution.
  smooth(); // Supposedly makes the game run smoother. 
  for (int i = 0; i<droids.length; i++) { // Loop through the droids array for the images to be loaded.
    droids[i] = loadImage("droid_" + i + ".png"); // Load image of droid using i variable from loop.
  }
  
  for (int k = 0; k<partsImg.length; k++) { // Repeat previous process for parts images.
    partsImg[k] = loadImage("part_" + k + ".png") ;
  }
  spawnParts(0, width - 200, 0, 0, numberOfParts);

}

void draw() {

  switch(state) { // Switch statement for handling the state of the game during play, menu and game over screens.
    case 0:
      menuBackground = loadImage("menuBackground.jpg"); // Load menu background.
      background(menuBackground);
      textSize(60); // Set text size.
      fill(255, 231, 22);
      text("Droid Builder", width/2 - 170, height/2); // Display text
      textSize(40);
      text("Press ENTER key to start!", width/2 - 200, height/2 + 50);
      break;
    case 1:
      gameBackground = loadImage("gameBackground.jpg");
      background(gameBackground);
      moveParts(); // Call functions for moving the parts on the screen after storing them in array.
      newDroid.display(); // Display the new droid 
      newDroid.update(); // Update the new droid.
      textSize(100);
      text(score, width - 200, 100);
      mouseControl();  // Handles all dragging and clicking of mouse based components.
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

void keyPressed() { // Watches for if a key is pressed.
  if(key == ENTER) state++; // If key is ENTER then change the games state from menu to game. 
  if(state > 2 ) { // If state is over 2 which means the game is over, display the menu.
    state=0;
    
  }
}

void moveParts() { // Move parts method.
  for (int i = 0; i < parts.size(); i++) { // Loop through each parts and display them on screen. 
    parts.get(i).display();
    parts.get(i).drop(1); 
  }
}

void mouseControl() {
    
  for (int i = 0; i < parts.size(); i++) { // For each of the parts in the parts array.
    if (dist(mouseX, mouseY, parts.get(i).x, parts.get(i).y) < 100) { // Check if the mouses x and y are in the vicinity of the parts x or y.
      if (mousePressed && (mouseButton==LEFT) && !mouseStop) { // If the mouse is pressed and the mouse is not stopped.
        mouseStop = true; // set the mouse locked to true to prevent picking up other objects.
        parts.get(i).x = mouseX; // Set the component position to the same as the mouse.
        parts.get(i).y = mouseY;
        if (dist(parts.get(i).x, parts.get(i).y, newDroid.getXPos(), newDroid.getYPos() + 100) < 100) { // Then check if the parts x and y match the vicinity of the droid.
          score++; // If so increase the score by 1.
          if (parts.get(i).partName == "HEAD") { // if the part is a head.
            newDroid.setHasHead(); // Update the boolean set head method.
          } else if (parts.get(i).partName == "ARM_LEFT") { // The same principle for the arms.
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
