float x = 0;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
  frameRate(.5);
}

void draw() {
  background(random(20,100), random(100,255), random(100, 255));
  while (x<50) {
    fill(0,random(100, 255), random(50, 255));
    triangle(random(500), random(height), random(width), random(height), random(width), random(height)); 
    ellipse(random(width), random(height), random(50), random(50));
    rect(random(width), random(height), random(30), random(30)); 
    x++;
  }
  x = 0;
}

