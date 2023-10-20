PImage ak47_no, ak47_nomag, ak47_nostock, ak47, bg, mag, stock;
Part[] parts;
boolean collision = false;
int numberOfParts = 5;
int difficulty = 1;
int score;
float diam = 80;

class Part {
  
  public int x;
  public int y;
  PImage partName;
  
  Part(int xVal, int yVal, PImage part) {
    x = xVal;
    y = yVal;
    partName = part;
  }
  
  public void drop(float speed){
    y += speed;
  }
  
  public void display() {
    fill(255, 0, 0);
    rect(x, y, 80, 80);
    image(partName, x, y, 80, 80);

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
  
  
  //public int giveX() {
    //return posX;
  //}
  void display() {
    image(ak47_no, xPos, yPos, 390, 200);
    ellipse(xPos + 250, yPos + 50, 50, 50);
  }

  void update() {
    //xPos+=speed;
    if(xPos > width) {
     xPos = -200; 
    }
  }
  
  public float getXPos() {
    return xPos;
  }
  public float getYPos() {
    return yPos;
  }
  
};


Kolashnikov kolash = new Kolashnikov(200, 400 ,2, false);


void spawnParts(int xMin, int xMax, int yMin, int yMax, int num){
  parts = new Part[num];
  
  for(int i = 0; i<parts.length; i++){ 
    int x = int(random(xMin, xMax));
    int y = int(random(yMin, yMax));
    parts[i] = new Part(x, y, mag);
    
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
  
}

void moveParts(){
  for(int i = 0; i < parts.length; i++) {
      parts[i].display();
      parts[i].drop(0);
  }

  
}
void mouseDragged() {
  for(int i = 0; i < parts.length; i++) {
      if (pointInCircle(mouseX, mouseY, parts[i].x, parts[i].y, diam - 20)) {
        parts[i].x = mouseX;
        parts[i].y = mouseY;
        
        if (dist(parts[i].x, parts[i].y, kolash.getXPos() + 250, kolash.getYPos() + 50) < 50) {
          println("OK");
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
