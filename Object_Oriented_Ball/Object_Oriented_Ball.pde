Ball[] bouncers = new Ball[100];

void setup() {
  size(800, 800);
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i] = new Ball();
  }
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0);
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].display();
    bouncers[i].move();
    bouncers[i].bounce();
    for (int j = 0; j < bouncers.length; j++) {
      if (i!=j) {
        bouncers[i].collision(bouncers[j]);
      }
    }
  }
}

class Ball {
  float sz, hue, sat, bright, alpha;
  PVector loc, vel;

  Ball() {
    sz = 50;
    loc = new PVector(random(0+sz, width/2 - sz), random(0+sz, height/2-sz));
    vel = PVector.random2D();
    hue = random(360);
    sat = 20;
    bright = 100;
    alpha = 150;
  }
  void display() {
    fill(hue, sat, bright, alpha);
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

