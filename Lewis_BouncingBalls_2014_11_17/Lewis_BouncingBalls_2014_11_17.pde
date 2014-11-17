float x = 50;
float y = 50;
float vx = 5;
float vy = 1;
float ax = 0;
float ay = 1;
float sz = 20;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  vx += ax;
  vy += ay;
  x += vx;
  y += vy;

  ellipse(x, y, sz, sz);
  if (y+sz/2>height) {
    vy =-vy;
  }
  if (x+sz/2 > width || x-sz/2 < 0) {
    vx *= -1;
  }
}

