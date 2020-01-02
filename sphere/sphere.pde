int counter;
int total;
boolean record;
float percent;

void setup() {  
  size(480, 480, P3D);
  counter = 0;
  total = 600;
  record = false;
  percent = 0;
}        
void draw() {
  if (record) {
    percent = float(counter) / total;
    if (counter == total-1){
      exit();
    }
  } else {
    percent = float(counter % total) / total;
  }
  render(map(percent,0, 1, 0, TWO_PI));
  counter++;
}

void render(float percent){
  if (percent <= TWO_PI){
    textSize(32);
    textMode(SHAPE);
    stroke(150, 0, 50);
    text("LOOP", 0, 0);
  }
  translate(width/2, width/2);
  directionalLight(50,0,150,1,1,-1);
  rotateX(-percent);
  rotateX(-PI/4);
  rotateY(PI/4);
  background(0);  
  fill(255); 
  strokeWeight(8);
  stroke(150, 0, 50);
  ellipseMode(CENTER);
  float limit = map(sin(percent) + 2, 1, 2, 1, 5);
  for (float a = 0;a < limit;a += 1){
    rotateY(PI / limit);
    ellipse(0, 0, width/2, height/2);
  }
  rotateX(-PI/2);
  ellipse(0, 0, width/2, height/2);
}
