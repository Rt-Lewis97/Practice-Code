PVector loc;
PVector acc;
PVector vel;
float sz;

void setup() {
  noStroke();
  size(800, 800);
  colorMode(HSB, 360, 100,100,100);

  loc = new PVector(width/2, height/2);
  sz = 30;
  vel = new PVector(0,0);
  acc = new PVector(random(-1,1),random(-1,1));
}

void draw() {
  fill(frameCount%360, 100,100,100);
  ellipse(loc.x, loc.y, sz, sz);
  acc.set(random(-1,1),random(-1,1));
  vel.add(acc);
  loc.add(vel);

  if (loc.x+sz/2 > width) {
    loc.x = 0+sz;
  }
  if (loc.y+sz/2 > height) {
    loc.y=0+sz;
  }
  if ( loc.x - sz/2 < 0) {
    loc.x=width-sz;
  }
  if (loc.y - sz/2 < 0 ) {
    loc.y = height-sz;
  }
  
  
}

