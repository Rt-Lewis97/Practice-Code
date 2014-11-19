float locx, locy;
float accx, accy;
float velx, vely;
float sz;

void setup() {
  size(800, 800);

  locx = width/2;
  locy = height/2;
  sz = 30;
  velx = 1;
  vely = 1;
  accx = 0;
  accy = 0;
}

void draw() {
  background(0);
  ellipse(locx, locy, sz, sz);
  locx+=velx;
  locy+=vely;
  velx+=accx;
  vely+=accy;

  if (locx+sz/2 > width) {
    locx = 0;
  }
  if (locy+sz/2 > height) {
    locy=0;
  }
}

