

PImage ak47_base, ak47_mag;

class Part {
  float x;
  float y;
  float dx;
  float dy;
  void display() {
     image(ak47_mag, x, y, 50,50); 
  }
}

class Kolashnikov{
  float xpos, speed;
  Kolashnikov(float x, float s) {
    xpos = x;
    speed = s;
  }
  
  void display() {
    image(ak47_base, xpos, height/2, 200, 100);
  }

  void update() {
    xpos+=speed;
    if(xpos > width) {
     xpos = 0; 
    }
    
  }
 
};


class Conv {
  float x;
  float y;
  float dx;
  float dy;
  void display() {
    fill(0,0,0);
     rect(0, 0, width, 30); 
  }
}
  

Part magazine = new Part();
Kolashnikov kolash = new Kolashnikov(0, 0.5);
Conv conv = new Conv();

float diam;


void setup() {
  
  size(1280, 720);
  smooth();

  magazine.x = 250;
  magazine.y = 250;
  diam = 50;
  ak47_base = loadImage("ak47.png");
  ak47_mag = loadImage("ak47_mag.png");
  conv.display();
  

  
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
