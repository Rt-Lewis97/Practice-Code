float x = 50;
float y = 50;
float velx = 3;
float vely = 3;
float accx = .4;
float accy = .4;
float sz = 20;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  velx += accx;
  vely += accy;
  x += velx;
  y += vely;

  ellipse(x, y, sz, sz);
  if (y+sz/2>height) {
    y=height-sz/2;
    vely *= -1;
  }
  if (x+sz/2 > width || x-sz/2 < 0) {
    velx *= -1;
  }
}

