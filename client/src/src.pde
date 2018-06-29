boolean state;
int alpha;
Entity player, opponent;

boolean[] keysPressed;
ArrayList<Bullet> bullets;

void setup() {
  state = true;
  alpha = 255;
  
  size(1600, 1600);
  
  player = new Entity();
  opponent = new Entity(1.0, width / 2, 0);
  keysPressed = new boolean[256];
  bullets = new ArrayList<Bullet>();
}

void draw() {
  handleInput();
  
  // Move things
  player.move();
  
  for (Entity e : bullets) e.move();
  
  // Remove anything not visible
  ArrayList<Bullet> remove = new ArrayList<Bullet>();
  for (Bullet b : bullets) {
    if (b.isOffScreen()) {
      remove.add(b);
    }
  }
  
  for (Bullet b : remove) { bullets.remove(b); }
  
  // Draw the things
  background(255);
  
  fill(0);
  for (Bullet b : bullets) {
    rect((float) b.getXPos(), (float) b.getYPos(), (float) Bullet.bWidth, (float) Bullet.bHeight);
  }
  
  fill(0, 0, 255);
  ellipse((float) player.getXPos(), (float) player.getYPos(), 50.0, 50.0);
  
  fill(255, 0, 0);
  ellipse((float) opponent.getXPos(), (float) opponent.getYPos(), 50.0, 50.0);
  
  // TODO: Bullets colliding with player or opponent
}

void handleInput() {
  if (keysPressed['w']) {
    player.modifyYVel(-0.3);
  }
  
  if (keysPressed['s']) {
    player.modifyYVel(0.3);
  }
  
  if (keysPressed['a']) {
    player.modifyXVel(-0.3);
  }
  
  if (keysPressed['d']) {
    player.modifyXVel(0.3);
  }
}

void mousePressed() {
  bullets.add(new Bullet(mouseX, mouseY, player.getXPos(), player.getYPos(), player.getVel()));
}

void keyPressed() {
  keysPressed[key] = true;
}

void keyReleased() {
  keysPressed[key] = false;
}
