int posT = 1;
int c = 299792458;
int posX = c;
int size = 20;

//Change me to observe
float targetV = 0;

void setup(){
  
  rectMode(CENTER);
  size(1000,1000);
  
  line(width/2,0,width/2,height);
  line(0, height/2, width, height/2);
  
  // Setup ticks
  for (int i = 0; i < width; i+= width/10) {
    line(i,height/2 - 10, i, height/2 +10);
  }
  for (int i = 0; i < height; i+= height/10) {
    line(width/2 - 10,i, width/2 + 10, i);
  }
  
  drawVelocityLine(c);
  
  fill(255,0,0);
  size = 10;
  drawVelocityLine(c/3);
}

void drawVelocityLine(double mps) {
  for (int t = -10; t < 10; t++) {
    float xPos = TransformX((float)mps*t, (float)t);
    float tPos = TransformT((float)mps*t,(float)t);
    print(xPos);
    print(tPos);
    rect((float)xScale(xPos),(float)tScale(tPos),size,size);
  }
}

double xScale(double x){
  double ticks = (x / c);
  return width/2 + ticks * width/10;
}

double tScale(double t) {
  return (height/2 - t * height/10);
}

double gamma(float v) {
  return 1 / (sqrt(1-(sq(v)/sq(c))));
}

float TransformX(float x, float t) {
  return (float)gamma(targetV) * (x - (targetV*t));
}

float TransformT(float x, float t) {
  return (float)gamma(targetV) * (t - ((targetV*x)/sq(c)));
}

float velocity(float x, float t) {
  return x/t;
}
