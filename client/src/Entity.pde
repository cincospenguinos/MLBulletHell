public class Entity {
  protected double xPos, yPos;
  protected double w, h;
  protected double xVel, yVel;
  protected double mass;
  
  private static final double CONST_FRICTION = 0.08;
  
  public Entity() {
    mass = 1.0;
    xPos = width / 2;
    yPos = height - 50;
  }
  
  public Entity(double m, double x, double y) {
    mass = m;
    xPos = x;
    yPos = y;
  }
  
  public void move() {
    if (yPos + 50.0 > height) {
      yVel = 0.0;
      yPos = height - 50;
    } else if (yPos < 0) {
      yPos = 0;
      yVel = 0;
    }
    
    if (xPos + 50.0 > width) {
      xVel = 0.0;
      xPos = width  - 50.0;
    } else if (xPos < 0) {
      xPos = 0.0;
      xVel = 0.0;
    }
    
    // apply friction
    xVel = (Math.abs(xVel) - (CONST_FRICTION * mass)) * Math.signum(xVel);
    yVel = (Math.abs(yVel) - (CONST_FRICTION * mass)) * Math.signum(yVel);
    
    // then apply movement
    xPos += xVel;
    yPos += yVel;
  }
  
  public void setPosition(double x, double y) {
    xPos = x;
    yPos = y;
  }
  
  public double getXPos() { return xPos; }
  public double getYPos() { return yPos; }
  
  public double getXVel() { return xVel; }
  public double getYVel() { return yVel; }
  
  public double getVel() { return Math.sqrt(xVel * xVel + yVel * yVel); }
  
  public void modifyXVel(double val) { xVel += val; }
  public void modifyYVel(double val) { yVel += val; }
}
