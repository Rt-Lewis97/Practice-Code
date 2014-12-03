Gball[] b = new Gball[100];

void setup() {
  size(800, 800);
  for (int i = 0; i < b.length; i++) {
    b[i] = new Gball();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < b.length; i++) {
    b[i].move();
    b[i].bounce();
    b[i].display();
  }
}

class Gball {
  float sz;
  PVector loc, vel, acc;

  Gball() {
    sz = random(5,100);
    loc = new PVector(random(sz, width -sz), random(height/2));
    vel = new PVector(0, 0);
    acc = new PVector(0, .1);
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
    vel.add(acc);
  }

  void bounce() {
    if (loc.y > height - sz/2) {
      loc.y = height - sz/2;
      vel.y = -abs(vel.y);
    }
  }
}



















