//Set up particle system
ArrayList<Particle> part = new ArrayList<Particle>();

//Variables used outside the particle
float sz = 40; 
float max = 70;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(0, 0, 100);

  // Slow down insert rate
  if (frameCount%20 == 0) {
    part.add(new Particle(mouseX, mouseY, random(-1, 1), random(-1, 1)));
  }

  //Create initial balls
  for (int i = part.size ()-1; i>=0; i--) {
    Particle p = part.get(i);
    p.display();
    p.move();

    //Create new balls and remove old ones when they hit the bottom
    if (p.bottom()) {

      fill(20, 50, 100);
      part.add(new Particle(p.loc.x, p.loc.y, random(-1, 1), -5));
      part.add(new Particle(p.loc.x, p.loc.y, random(-1, 1), -5));
      part.remove(p);
      for (int j = part.size ()-1; j>=0; j--) {
        Particle d = part.get(j);
        d.display2();
        d.move();
      }
    }
  }

  // set a maximum amount of balls
  if (part.size() > max) {
    part.remove(0);
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
    alpha = 120;
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
    fill(22, 98, 99, alpha);
    ellipse(loc.x, loc.y, sz/2, sz/2);
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

