//Set up particle systems
ArrayList<Particle> part = new ArrayList<Particle>();
ArrayList<Smallpart> piece = new ArrayList<Smallpart>();


//Variables used outside the particle
float sz = 40; 
float max = 70;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  background(0, 0, 0);

  // Slow down insert rate
  if (frameCount%20 == 0) {
    part.add(new Particle());
  }

  //Create initial balls
  for (int i = part.size ()-1; i>=0; i--) {
    Particle p = part.get(i);
    p.display();
    p.move();

    //Create new balls and then remove old ones when the old balls hit the bottom
   
    if (p.bottom()) {

      fill(20, 50, 100);
      piece.add(new Smallpart(p.loc.x, p.loc.y));
      piece.add(new Smallpart(p.loc.x, p.loc.y));
      piece.add(new Smallpart(p.loc.x, p.loc.y));
      piece.add(new Smallpart(p.loc.x, p.loc.y));
      piece.add(new Smallpart(p.loc.x, p.loc.y));

      part.remove(p);
    }
    
    //Run the new balls
    
    for (int j = piece.size ()-1; j>=0; j--) {
      Smallpart d = piece.get(j);
      d.display();
      d.move();
    }
  }

  //Set a maximum amount of balls
  
  if (part.size() > max) {
    part.remove(0);
  }
}

//Initial ball class

class Particle {
  PVector loc, vel, acc;
  float sz, lifespan, alpha;

  Particle() {
    acc = new PVector(0, .1);
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = new PVector(mouseX, mouseY);
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

//Allowing the system to know if the balls hit the bottom

  boolean bottom() {
    if (loc.y+sz/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}

//Setting up the smaller balls

class Smallpart {
  PVector loc, vel, acc;
  float sz, lifespan, alpha;

  Smallpart(float x, float y) {
    
    //random vectors so the "explosion" is unique each time
    
    acc =  new PVector(random(-.1, .1), .1);
    vel = new PVector(random(-1, 1), -8);
    loc = new PVector(x, y);
    sz = 20;
    alpha = 80;
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  void display() {
    fill(22, 98, 99, alpha);
    ellipse(loc.x, loc.y, sz/2, sz/2);
    alpha --;
  }
}

