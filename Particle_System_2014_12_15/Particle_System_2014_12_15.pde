ArrayList<Particle> part = new ArrayList<Particle>();
float sz = 40;


void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(0, 0, 100);
  part.add(new Particle(mouseX, mouseY, random(-1, 1), random(-1, 1)));
  for (int i = part.size ()-1; i>=0; i--) {
    Particle p = part.get(i);
    p.display();
    p.move();

    if (p.bottom()) {
      part.remove(p);
      fill(20, 50, 100);
      part.add(new Particle(random(width), height-sz/2, 0, -10));

      for (int j = part.size ()-1; j>=0; j--) {
        Particle d = part.get(j);
        d.display2();
      }
    }
  }
}

class Particle {
  PVector loc, vel, acc;
  float sz, lifespan, alpha;

  Particle(float x, float y, float z, float f) {
    acc = new PVector(0, .1);
    vel = new PVector(z, f);
    loc = new PVector(x, y);
    sz = 40;
    alpha = 100;
    lifespan = 50;
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  void display() {
    fill(190, 50, 100, alpha);
    ellipse(loc.x, loc.y, sz, sz);
    alpha --;
  }
  
  void display2() {
    fill(100, 40, 100, alpha);
    ellipse(loc.x, loc.y, sz, sz);
    alpha --;
  }

  boolean bottom() {
    if (loc.y+sz/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}

