class Part { // Decare Parts class. Used to create all component objects.
  
  private float x; // X position of Object.
  private float y; // Y position of Object
  private PImage img; // 
  private String partName;
  
  Part(float xVal, float yVal, PImage part, String partType) { 
    x = xVal;
    y = yVal;
    img = part;
    partName = partType;
  }
  
  public void drop(float speed){ // method for showing the drop speed of the components. 
    y += speed; // Increase Y variable so products fall at a set rate.
  }
  
  public void display() { // Method for rendering the Object on screen.
    image(img, x, y, 80, 80); // Image with name of PImage variable.
  } 
} 
