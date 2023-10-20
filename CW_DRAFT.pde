

PImage ak47_base, ak47_mag;

class Part {
  float x;
  float y;
  float dx;
  float dy;
  void display() {
     image(ak47_mag, x, y, 100,100); 
  }
}

class Kolashnikov{
  float xpos;
  float speed;
  Kolashnikov(float x, float s) {
    xpos = x;
    speed = s;
  }
  
  void display() {
    image(ak47_base, xpos, height/2, 390, 200);
  }

  void update() {
    xpos+=speed;
    if(xpos > width) {
     xpos = 0; 
    }
    
  }
 
};



  

Part magazine = new Part();
Kolashnikov kolash = new Kolashnikov(0, 2);


float diam;


void setup() {
  
  size(1280, 720);
  smooth();
  magazine.x = 250;
  magazine.y = 250;
  diam = 100;
  ak47_base = loadImage("ak47.png");
  ak47_mag = loadImage("ak47_mag.png");
  

  
}

void draw() {
  background(255);
  kolash.display();
  kolash.update();
  magazine.display();
  
  
}

void mouseDragged() {
  if (pointInCircle(mouseX, mouseY, magazine.x, magazine.y, diam / 2)) {
    magazine.x = mouseX;
    magazine.y = mouseY;
  }
}

boolean pointInCircle(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
