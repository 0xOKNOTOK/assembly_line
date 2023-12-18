ArrayList<Droid> droidstack = new ArrayList<Droid>(); //<>//
ArrayList<BodyPart> parts = new ArrayList<BodyPart>(); // Create an ArrayList to store all Parts objects.
PImage[] droids = new PImage[4];
PImage[] partsImg = new PImage[2];
int numberOfParts = 2; // Sets overall number of parts to be displayed during level.
int score; // Stores the current score of the game, point added per component added to product.
float difficultySpeed = 2; //Sets the speed at which the droid crosses the screen.
boolean mouseStop = false; // Stores the state of the mouse if an item is being selected.
int state = 0; // Global state for the games screens.

Droid newDroid = new Droid(droids[0], -100, 400, difficultySpeed, false, false); // Initialise a new object with class of Droid.


void spawnParts(int xMin, int xMax, int yMin, int yMax, int num) { // Spawn parts randomly at the top of the screen. 
  for(int i = 0; i<num; i++) {
    int partNum = int(random(1, 3));
    int x = int(random(xMin, xMax));
    int y = int(random(yMin, yMax));
    if (partNum == 1) {
      parts.add(new BodyPart(x, y, partsImg[0], "HEAD"));
    } else if (partNum == 2) {
      parts.add(new BodyPart(x, y, partsImg[1], "BLASTER"));
    }
  }
}

void spawnDroids(int x, int y, float speed, boolean hasHeadEquip, boolean hasBlasterEquip, int num) {
  for (int i=0; i<num; i++) {
    droidstack.add(new Droid(droids[0], x, y, speed, hasHeadEquip, hasBlasterEquip));
  }
}

void setup() {
  size(1280, 720);


  smooth();
  for (int i = 0; i<droids.length; i++) {
    droids[i] = loadImage("ak47_" + i + ".png");
  }
  for (int k = 0; k<partsImg.length; k++) {
    partsImg[k] = loadImage("part_" + k + ".png") ;
  }
  spawnParts(0, width, 0, 0, numberOfParts);
  spawnDroids(100, 500, 2, false, false, 5);
}

void draw() {
  switch(state) {
    case 0:
      text("Droid Builder! Press any key to start!", width/2, height/2);
      break;
    case 1:

      background(bg);
      moveParts();
      newDroid.display();
      newDroid.update();
      textSize(100);
      text(score, width - 200, 100);
      mouseControl();
      break;
     default:
       println("INTENRAL GAME ERROR");
       break;
  }
  
}

void keyPressed() {
  if(key == 'n') state++;
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
        if (dist(parts.get(i).x, parts.get(i).y, newDroid.getXPos() + 300, newDroid.getYPos() + 100) < 100) {
          score++;
          if (parts.get(i).partName == "HEAD") {
            newDroid.setHasHead();
          } else if (parts.get(i).partName == "BLASTER") {
            newDroid.setHasBlaster();
          }
          parts.remove(i);
        }
      } else {
        mouseStop = false;
      }
    }
  }

  
}
