ArrayList<Ball> balls = new ArrayList<Ball>();
float max = 20;
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  balls.add(new Ball());
  background(0, 0, 100);
  for (int i = 0; i < balls.size (); i++) {
    Ball b = balls.get(i);
    b.display();
    b.move();
    b.bounce();
    for (int j = 0; j < balls.size (); j++) {
      if (i!=j) {
        Ball b2 = balls.get(j);
        b.collision(b2);
      }
    }
  }
  if (balls.size() > max) {
    balls.remove(0);
  }
}

class Ball {
  float sz, hue, sat, bright, alpha;
  PVector loc, vel;

  Ball() {
    sz = 50;
    loc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();
    hue = random(360);
    sat = 20;
    bright = 100;
    alpha = 50;
  }
  void display() {
    fill(hue, sat, bright, alpha);
    stroke(300);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
  }

  void bounce() {
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      vel.x *= -1;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      vel.y *= -1;
    }
  }
  void collision(Ball someotherball) {
    if (loc.dist(someotherball.loc) < sz/2 + someotherball.sz/2) {
      vel = PVector.sub(loc, someotherball.loc);
      vel.normalize();
    }
  }
}

