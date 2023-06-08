PImage textureImage;

class MagicOrbs{
  float trapX1;
  float trapY1;
  float trapZ1;
  boolean flag = true;
  
 public MagicOrbs(){
    randomPosOrbs();
  }
  
  void randomPosOrbs(){
    trapX1 = random(2550, 3000);
    trapY1 = 490;
    trapZ1 = round(random(1)) == 0 ? -220 : 220;
  }
  
  
  void oModel(){
      noStroke();
      PImage img=loadImage("orb.png");
      PShape Sphere=createShape(SPHERE,30);
      translate(trapX1, trapY1, trapZ1);
      Sphere.setTexture(img);
      shape(Sphere);
  }
  
  void oMovement(){
    oModel();
    while(true){
      if (trapZ1 < -220)
        flag = true;
        
      else if (trapZ1 > 220)
        flag = false;
        
      if (flag == true)
        trapZ1 += random(3, 10);
      
      else
        trapZ1 -= random(3, 10);

     break;
    }
  }
}

class Spikes{
  float trapX2;
  float trapY2;
  float trapZ2;
  boolean flag = true;
  
  PImage img = loadImage("spike.jpg");
  
  public Spikes(){
    randomPosSpikes();
  }
  
  void randomPosSpikes(){
    trapX2 = random(650, 850);
    trapY2 = 520;
    trapZ2 = random(-180, 180);
  }
   
  void sModel(){
    textureImage = loadImage("spike.jpg");
    translate(trapX2, trapY2, trapZ2);
    strokeWeight(1);
    noStroke();
    rotateX(-PI/2);
    float radius = 20;
    float height = 80;
    int numSegments = 50;
  
    float angleStep = TWO_PI / numSegments;
    textureMode(NORMAL); 
    beginShape(TRIANGLE_FAN);
    texture(img);
    vertex(0, 0, -height / 2);
    for (int i = 0; i <= numSegments; i++) {
    float x = radius * cos(i * angleStep);
    float y = radius * sin(i * angleStep);
    float u = map(x, -radius, radius, 0, 1);
    float v = map(y, -radius, radius, 0, 1);
    vertex(x, y, height / 2, u, v);

  }
    endShape();
    
  }
  
  void sMovement(){
    sModel();
    
    while(true){
      if (trapY2 < 522)
        flag = true;

      else if (trapY2 > 673)
        flag = false;

      if (flag == true)
        trapY2 += 3;
        
      else
        trapY2 -= 3;

     break;
    }
  }
}

class Stalactite{
  float trapX3;
  float trapY3;
  float trapZ3;
  
  public Stalactite(){
    randomPosStalactite();
  }
   
  void randomPosStalactite(){
    trapX3 = random(980, 1250);
    trapY3 = -200;
    trapZ3 = random(-180, 180);
  }
   
  void stModel(){
    textureImage = loadImage("stalactite.jpg");
    translate(trapX3, trapY3, trapZ3);
    strokeWeight(1);
    noStroke();
    rotateX(PI/2);
    float radius = 20;
    float height = 160;
    int numSegments = 50;
  
    float angleStep = TWO_PI / numSegments;

    //Draw cone
    beginShape(TRIANGLE_FAN);
    texture(textureImage);
    vertex(0, 0, -height / 2);
    for (int i = 0; i <= numSegments; i++) {
    float x = radius * cos(i * angleStep);
    float y = radius * sin(i * angleStep);
    float u = map(x, -radius, radius, 0, 1);
    float v = map(y, -radius, radius, 0, 1);
    vertex(x, y, height / 2, u, v);
    }
    endShape();
    
    //Laser indicator
    beginShape(QUAD_STRIP);
    translate(0, 0, -520);
    rotateX(PI/2);
    fill(255, 0, 0);
    for (int j = 0; j <= numSegments; j++) {
      float a = radius/10 * cos(j * angleStep);
      float b = radius/10 * sin(j * angleStep);
      vertex(a, -height, b);
      vertex(a, height + 300, b);
    }
    endShape();
  }
  
  void stFall(){
    stModel();
    float randomSpeed = random(55, 75);
    while(true)
    {
      if(trapY3 <= 600)
        trapY3 += randomSpeed;
      break;
    }
  }
}

class Arrows{
  float trapX4;
  float trapY4;
  float trapZ4;
  
  public Arrows(){
    randomPosArrow();
  }
   
  void randomPosArrow(){
    trapX4 = random(1800, 2150);
    trapY4 = random(500, 550);
    trapZ4 = 220;
  }
  
  void arModel(){
    textureImage = loadImage("arrow.png");
    translate(trapX4, trapY4, trapZ4);
    strokeWeight(1);
    noStroke();
    //rotateX(PI/2);
    float ar_radius = 5;
    float ls_radius = 20;
    float height = 60;
    int numSegments = 50;
  
    float angleStep = TWO_PI / numSegments;
    //Drawing Cone
    beginShape(TRIANGLE_FAN);
    texture(textureImage);
    vertex(0, 0, -height / 2);
    for (int i = 0; i <= numSegments; i++) {
    float x = ar_radius * cos(i * angleStep);
    float y = ar_radius * sin(i * angleStep);
    float u = map(x, -ar_radius, ar_radius, 0, 1);
    float v = map(y, -ar_radius, ar_radius, 0, 1);
    vertex(x, y, height / 2, u, v);
    }
    endShape();
    //Drawing Laser Guiding Missile Indicator xd
    beginShape(QUAD_STRIP);
    translate(0, 0, -370);
    rotateX(PI/2);
    fill(255, 0, 0);
    for (int j = 0; j <= numSegments; j++) {
      float a = ls_radius/10 * cos(j * angleStep);
      float b = ls_radius/10 * sin(j * angleStep);
      vertex(a, -height, b);
      vertex(a, height + 300, b);
    }
    endShape();
  }
  
  void arFly(){
    arModel();
    //float randomSpeed = random(15, 55);
    while(true)
    {
      if(trapZ4 >= -250)
        trapZ4 -= 15;
      break;
    }
  }
}
