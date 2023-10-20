
PImage ak47_base, ak47_mag, bg;
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
    image(partName, x, y, 80, 80);
    
    
  }
  
  
  
  
}

class Kolashnikov{
  float xPos;
  float yPos;
  float speed;
  Kolashnikov(float x, float y, float s) {
    xPos = x;
    yPos = y;
    speed = s;
  }
  
  void display() {
    image(ak47_base, xPos, yPos, 390, 200);
  }

  void update() {
    xPos+=speed;
    if(xPos > width) {
     xPos = -200; 
    }
    
  }
 
};


Kolashnikov kolash = new Kolashnikov(-200, 400 ,2);


void spawnParts(int xMin, int xMax, int yMin, int yMax, int num){
  parts = new Part[num];
  
  for(int i = 0; i<parts.length; i++){ 
    int x = int(random(xMin, xMax));
    int y = int(random(yMin, yMax));
    parts[i] = new Part(x, y, ak47_mag);
    
  }
  
}






void setup() {
  
  size(1280, 720);
  bg = loadImage("back.jpg");
  smooth();
  ak47_base = loadImage("ak47.png");
  ak47_mag = loadImage("ak47_mag.png");
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
      parts[i].drop(2);
  }

  
}
void mouseDragged() {
  for(int i = 0; i < parts.length; i++) {
      if (pointInCircle(mouseX, mouseY, parts[i].x, parts[i].y, diam - 20)) {
        parts[i].x = mouseX;
        parts[i].y = mouseY;
        
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
