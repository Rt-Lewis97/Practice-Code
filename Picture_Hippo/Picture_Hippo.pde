PImage r;

void setup(){
  size(1080, 878);
  r = loadImage("http://media-cache-ak0.pinimg.com/736x/6c/5b/f9/6c5bf93f1c42fe5d591ca2a84996cb26.jpg");
}

void draw(){
  image(r, 0, 0, 1080, 878);
}
