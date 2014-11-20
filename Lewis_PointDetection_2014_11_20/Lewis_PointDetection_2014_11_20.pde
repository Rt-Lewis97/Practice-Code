float sz;
PVector loc, vel;
PVector mouse;

void setup() {
  sz = 80;
  size(800, 800);
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  mouse = new PVector();
}

void draw() {

  loc.add(vel);
  background(0);

  ellipse(loc.x, loc.y, sz, sz);

  mouse.set(mouseX, mouseY);
  if (loc.dist(mouse) < sz) {
    fill(248, 27, 36.5);


    if (mouse.x > loc.x) {
      vel.x = -abs(vel.x);
    } else {
      vel.x = abs(vel.x);
    }
    if (mouse.y > loc.y) {
      vel.y = -abs(vel.y);
    } else {
      vel.y = abs(vel.y);
    }
  }
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
}

