ArrayList<Particle> part = new ArrayList<Particle>();

void setup() {
  size(displayWidth,displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  stroke(200, 50, 80);
}

void draw() {
  background(0, 0, 100);
  part.add(new Particle());
  for (int i = part.size ()-1; i>=0; i--) {
    Particle p = part.get(i);
    p.display();
    p.move();
  }
}

class Particle {
  PVector loc, vel, acc;
  float sz, lifespan, alpha;

  Particle() {
    acc = new PVector(.1, .2);
    vel = new PVector(random(-1, 1), random(-1, 0));
    loc = new PVector(mouseX, mouseY);
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
    rect(loc.x,loc.y,sz,sz);
   ellipse(loc.x, loc.y, sz, sz);
       alpha --;
  }
}

