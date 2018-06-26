public class Bullet extends Entity {
  
  public static final double bWidth = 10.0;
  public static final double bHeight = 20.0;
  
  private double targetX, targetY;
  private double vel;
  private boolean passedTarget;
  
  public Bullet(double tx, double ty, double x, double y, double v) {
    xPos = x + (Math.signum(tx - x) * 20.0);
    yPos = y + (Math.signum(ty - y) * 20.0);
    targetX = tx;
    targetY = ty;
    
    mass = 0;
    vel = v + 20.0;
    
    passedTarget = false;
  }
  
  public void move() {
    
    // Calculate xVel and yVel
    double distX = Math.abs(xPos - targetX);
    double distY = Math.abs(yPos - targetY);
    double distTot = Math.sqrt(distX * distX + distY * distY);
    
    if (distTot > vel && !passedTarget) {
      xVel = (distX / distTot) * vel * Math.signum(targetX - xPos);
      yVel = (distY / distTot) * vel * Math.signum(targetY - yPos);
    } else {
      passedTarget = true;
    }
    
    println(distTot);
    
    xPos += xVel;
    yPos += yVel;
  }
  
  public boolean isOffScreen() {
    return (xPos + bWidth > width) || (xPos < 0) || (yPos + bHeight > height) || (yPos < 0);
  }
}
