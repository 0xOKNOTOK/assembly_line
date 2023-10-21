PImage ak47_no, ak47_nomag, ak47_nostock, ak47, bg, mag, stock; //<>//
ArrayList<Part> parts = new ArrayList<Part>();
boolean collision = false;
int numberOfParts = 2; //<>//
int difficulty = 1;
int score;
float diam = 80; //<>//

class Part {
  
  public int x;
  public int y;
  public PImage partName;
  
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
  
  void display() {
    image(ak47_no, xPos, yPos, 390, 200);
  }

  void update() {
    xPos+=speed;
    if(xPos > width) {
     xPos = -200; 
    }
  }
  
  void setMagEquip(){
    hasMag = !hasMag;
    
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
      if (pointInCircle(mouseX, mouseY, parts.get(i).x, parts.get(i).y, diam - 20)) {
        parts.get(i).x = mouseX;
        parts.get(i).y = mouseY;
        
        if (dist(parts.get(i).x, parts.get(i).y, kolash.getXPos() + 250, kolash.getYPos() + 50) < 20) {
          score++;
          parts.remove(i);
          kolash.setMagEquip();
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
