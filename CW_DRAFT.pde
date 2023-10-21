PImage ak47_no, ak47_nomag, ak47_nostock, ak47, bg, mag, stock; // Initialize variables for images.  //<>//
ArrayList<Part> parts = new ArrayList<Part>(); // Create an ArrayList to store all Parts objects.
int numberOfParts = 2; // Sets overall number of parts to be displayed during level. //<>//
int score; // Stores the current score of the game, point added per component added to product.
 //<>//
class Part { // Decare Parts class. Used to create all component objects.
  
  private int x; // X position of Object.
  private int y; // Y position of Object
  private PImage partName; // 
  
  Part(int xVal, int yVal, PImage part) { 
    x = xVal;
    y = yVal;
    partName = part;
  }
  
  public void drop(float speed){ // method for showing the drop speed of the components. 
    y += speed; // Increase Y variable so products fall at a set rate.
  }
  
  public void display() { // Method for rendering the Object on screen.
    image(partName, x, y, 80, 80); // Image with name of PImage variable.

  } 
} 


class Kolashnikov{
  boolean hasMag;
  boolean hasStock;
  float xPos;
  float yPos;
  float speed;
  Kolashnikov(float x, float y, float s, boolean hasMagEquip) {
    xPos = x;
    yPos = y;
    speed = s;
    hasMag = hasMagEquip;
  }
  
  void display() {
    image(ak47_no, xPos, yPos, 600, 200);
  }

  void update() {
    xPos+=speed;
    if(xPos > width) {
     xPos = -200; 
    }
  }
  
  void addMag(float x, float y) {
    image(ak47_nostock, x, y, 600, 200);
    
  }
  

  
  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};


Kolashnikov kolash = new Kolashnikov(-100, 400 ,2, false);


void spawnParts(int xMin, int xMax, int yMin, int yMax, int num){

    
    for(int i = 0; i<num; i++){
        int partNum = int(random(1,3));
        println(partNum);
        int x = int(random(xMin, xMax));
        int y = int(random(yMin, yMax));
        if (partNum == 1){
          parts.add(new Part(x, y, mag));
        } else if (partNum == 2) {
          parts.add(new Part(x, y, stock));
          
        }
        
      
    }
  
}

void setup() {
  size(1280, 720);
  bg = loadImage("back.jpg");
  smooth();
  ak47 = loadImage("ak47.png");
  mag = loadImage("ak47_mag.png");
  stock = loadImage("ak47_stock.png");
  ak47_no = loadImage("ak47_no.png");
  ak47_nomag = loadImage("ak47_nomag.png");
  ak47_nostock = loadImage("ak47_nostock.png");
  spawnParts(0, width, 0, 0, numberOfParts);

}

void draw() {
  background(bg);
  moveParts();
  kolash.display();
  kolash.update();
  textSize(100);
  text(score, width - 200, height - 200);
  
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
          kolash.addMag(kolash.getXPos(), kolash.getYPos());
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
