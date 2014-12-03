Gball b;

void setup() {
  size(800, 800);
  b = new Gball();
}

void draw() {
  background(0);
  b.move();
  b.bounce();
  b.display();
}

class Gball {
  float sz;
  PVector loc, vel, acc;

  Gball() {
    sz = 30;
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
    acc = new PVector(2,3);
  }

  void display() {
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
    vel.add(acc);
  }

  void bounce() {
    if (loc.x +sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }
  }
}





















