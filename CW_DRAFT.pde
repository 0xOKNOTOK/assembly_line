

PImage ak47_base;

class Item {
  float x;
  float y;
  float dx;
  float dy;
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


  
  

Item ball = new Item();
Kolashnikov kolash = new Kolashnikov(0, 0.5);

float diam;


void setup() {
  
  size(displayWidth, displayHeight);
  smooth();
  ball.x = 250;
  ball.y = 250;
  diam = 125;
  ak47_base = loadImage("ak47.png");

  
}

void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  ellipse(ball.x, ball.y, diam, diam);
  kolash.display();
  kolash.update();
  
  
}

void mouseDragged() {
  if (pointInCircle(mouseX, mouseY, ball.x, ball.y, diam / 2)) {
    ball.x = mouseX;
    ball.y = mouseY;
  }
}

boolean pointInCircle(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
