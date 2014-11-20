float sz;
PVector loc;
PVector mouse;

void setup() {
  sz = 40;
  size(800, 800);
  loc = new PVector(width/2, height/2);
  mouse = new PVector();
}

void draw() {
  background(0);
  ellipse(loc.x,loc.y,sz,sz);
  mouse.set(mouseX, mouseY);
  if (loc.dist(mouse) < sz) {
    loc.set(random(width), random(height));
    fill(248,27,36.5);
  }
}

