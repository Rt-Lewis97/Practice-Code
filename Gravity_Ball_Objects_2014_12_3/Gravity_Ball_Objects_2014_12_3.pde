Gball[] b = new Gball[100];

void setup() {
  size(displayWidth, displayHeight);
  for (int i = 0; i < b.length; i++) {
    b[i] = new Gball(random(5, 100));
  }
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(360, 0, 100);
  for (int i = 0; i < b.length; i++) {
    b[i].move();
    b[i].bounce();
    b[i].display();
  }
}

class Gball {
  float sz, hue, bright, sat, alpha;
  PVector loc, vel, acc;

  Gball(float szvariable) {
    sz = szvariable;
    loc = new PVector(random(sz, width - sz), random(height/2));
    vel = new PVector(0, 2);
    acc = new PVector(0, .1);
    hue = random(360);
    sat = 20;
    bright = 100;
    alpha = 70;
  }

  void display() {
    fill(hue, sat, bright, alpha);
    ellipse(loc.x, loc.y, sz, sz);
  }  

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  void bounce() {
    if (loc.y > height - sz/2) {
      loc.y = height - sz/2;
      vel.y = -abs(vel.y);
    }
  }
}

















