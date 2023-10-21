ArrayList<Kolashnikov> weaponStack = new ArrayList<Kolashnikov>(); //<>//
ArrayList<Part> parts = new ArrayList<Part>(); // Create an ArrayList to store all Parts objects.
PImage[] weapons = new PImage[4];
PImage[] partsImg = new PImage[2];
int numberOfParts = 2; // Sets overall number of parts to be displayed during level. //<>//
int score; // Stores the current score of the game, point added per component added to product.
 //<>//

Kolashnikov kolash = new Kolashnikov(weapons[0], -100, 400 ,2, false, false);


void spawnParts(int xMin, int xMax, int yMin, int yMax, int num){
    for(int i = 0; i<num; i++){
        int partNum = int(random(1,3));
        println(partNum);
        int x = int(random(xMin, xMax));
        int y = int(random(yMin, yMax));
        if (partNum == 1){
          parts.add(new Part(x, y, partsImg[0]));
        } else if (partNum == 2) {
          parts.add(new Part(x, y, partsImg[0]));
          
        }
        
      
    }
  
}

void spawnWeapons(int x, int y, float speed, boolean hasMagEquip, boolean hasStockEquip, int num){
  for(int i=0; i<num; i++){
    weaponStack.add(new Kolashnikov(weapons[0],  x,  y,  speed,  hasMagEquip,  hasStockEquip));
    
  }
  
}

void setup() {
  size(1280, 720);
  //PImage bg = loadImage("back.jpg");
  smooth();
  for(int i = 0; i<weapons.length; i++) {
    weapons[i] = loadImage("ak47_" + i + ".png");
  }
  for(int k = 0; k<partsImg.length; k++) {
    partsImg[k] = loadImage("part_" + k + ".png") ;
  }
  spawnParts(0, width, 0, 0, numberOfParts);
  spawnWeapons(100, 500, 2, false, false, 5);

}

void draw() {
  background(0,0,0);
  moveParts();
  kolash.display();
  kolash.update();
  textSize(100);
  text(score, width - 200, height / 3);
  
}

void moveParts(){
  for(int i = 0; i < parts.size(); i++) {
      parts.get(i).display();
      parts.get(i).drop(1);
  }

  
}
void mouseDragged() {
  for(int i = 0; i < parts.size(); i++) {
      if (pointInCircle(mouseX, mouseY, parts.get(i).x, parts.get(i).y, 80 - 20)) {
        parts.get(i).x = mouseX;
        parts.get(i).y = mouseY;
        
        if (dist(parts.get(i).x, parts.get(i).y, kolash.getXPos() + 300, kolash.getYPos() + 100) < 100) {
          score++;
          kolash.setHasMag();
          kolash.setHasStock();
          parts.remove(i);

        }
      }
      
  }

}


boolean pointInCircle(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
     return false;
  }
}
