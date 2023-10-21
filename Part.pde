class Part { // Decare Parts class. Used to create all component objects.
  
  private int x; // X position of Object.
  private int y; // Y position of Object
  private PImage img; // 
  
  Part(int xVal, int yVal, PImage part) { 
    x = xVal;
    y = yVal;
    img = part;
  }
  
  public void drop(float speed){ // method for showing the drop speed of the components. 
    y += speed; // Increase Y variable so products fall at a set rate.
  }
  
  public void display() { // Method for rendering the Object on screen.
    image(img, x, y, 80, 80); // Image with name of PImage variable.

  } 
} 
