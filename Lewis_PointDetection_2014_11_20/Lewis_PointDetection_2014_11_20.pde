float sz, sz2;
PVector loc, vel, loc2, vel2;

void setup() {
  sz = 300;
  sz2 = 200;
  size(800, 800);
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  loc2 = new PVector(100, 100);
  vel2 = PVector.random2D();
}

void draw() {

  loc.add(vel);
  loc2.add(vel2);
  background(0);

  ellipse(loc.x, loc.y, sz, sz);
  ellipse(loc2.x, loc2.y, sz2, sz2);

  if (loc.dist(loc2) < sz/2 + sz2/2) {
    if (loc.x < loc2.x) {
      vel.x = -abs(vel.x);
      vel2.x = abs(vel2.x);
    } else {
      vel.x = abs(vel.x);
      vel2.x = -abs(vel2.x);
    }
    if (loc2.y > loc.y) {
      vel.y = -abs(vel.y);
      vel2.y = abs(vel2.y);
    } else {
      vel.y = abs(vel.y);
      vel2.y = -abs(vel2.y);
    }
  }
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
  if (loc2.x + sz2/2 > width || loc2.x - sz2/2 < 0) {
    vel2.x *= -1;
  }
  if (loc2.y + sz2/2 > height || loc2.y - sz2/2 < 0) {
    vel2.y *= -1;
  }
}

