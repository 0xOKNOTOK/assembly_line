
PImage ak47_base, ak47_mag;
Part[] parts;
boolean collision = false;
int difficulty = 10;






void spawnParts(int xMin, int xMax, int yMin, int yMax, int num){
  parts = new Part[num];
  
  for(int i = 0; i<parts.length; i++){ 
    int x = int(random(xMin, xMax));
    int y = int(random(yMin, yMax));
    parts[i] = new Part(x, y, 30, 15);
    
  }
  
}






void setup() {
  
  size(1280, 720);
  smooth();
  ak47_base = loadImage("ak47.png");
  ak47_mag = loadImage("ak47_mag.png");
  spawnParts(-250, width + 20, 0, -80, difficulty);

  
}

void draw() {
  background(255);
  moveWeapons();
  
  
}

void moveWeapons(){
  for(int i = 0; i < parts.length; i++) {
      parts[i].display();
      parts[i].drop(random(1,15));
    
    
  }

  
}
void mouseDragged() {
  /*
  if (pointInCircle(mouseX, mouseY, stock.x, stock.y, diam /2)) {
    stock.x = mouseX;
    stock.y = mouseY;
  } else if (pointInCircle(mouseX, mouseY, magazine.x, magazine.y, diam / 2)) {
    magazine.x = mouseX;
    magazine.y = mouseY;
    
  }
  */
}

boolean pointInCircle(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
