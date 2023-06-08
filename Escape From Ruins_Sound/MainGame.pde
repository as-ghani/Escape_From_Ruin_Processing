import processing.sound.*;

SoundFile coin;
SoundFile start;
SoundFile keyAvailable;
SoundFile lose;
SoundFile won;


int startTime;
int countdownDuration = 180;
int trigSt = 1;
int trigS = 1;
int trigAr = 2;
int trigO = 1;
int counter = 0;
boolean keyAquired = false;

float cameraDistance = 600;
float cameraAngleX = 0;
float cameraAngleY = 0;

Character mc;
Platform p;
ArrayList<Key> k = new ArrayList<Key>();
ArrayList<Coins> c = new ArrayList<Coins>();
ArrayList<MagicOrbs> o = new ArrayList<MagicOrbs>();
ArrayList<Spikes> s = new ArrayList<Spikes>();
ArrayList<Stalactite> st = new ArrayList<Stalactite>();
ArrayList<Arrows> ar = new ArrayList<Arrows>();



int score=0;
int coinCount=0;

void setup(){
  fullScreen(P3D);
  p = new Platform();
  mc = new Character();

  for(int i = 0;i < 10; i++){
     c.add(new Coins());
  }
  
  for(int i = 0; i < 1; i++){
    k.add(new Key());
  }
  

  lose = new SoundFile(this, "GameOver.mp3");
  won = new SoundFile(this, "Finish.mp3");
  coin = new SoundFile(this, "Coin.mp3");
  start = new SoundFile(this, "Start.mp3");
  keyAvailable = new SoundFile(this, "Key.mp3");
  start.play();
  startTime = millis();
}

void draw(){


  if(mc.posx > 2750 && trigO > 0) {
    for(int i = 0; i < 3; i++){
      o.add(new MagicOrbs());
      o.get(i).trapX1 += 250 + counter;
      counter += 250;
    }
    trigO--;
    
    while(true){
     if((o.get(1).trapX1 - o.get(0).trapX1)<100){
          o.get(0).trapX1 -= 160;
        }
     else if((o.get(1).trapX1 - o.get(0).trapX1) < -100){
          o.get(1).trapX1 += 160;
        }
     else if((o.get(2).trapX1 - o.get(1).trapX1) < 100){
          o.get(1).trapX1 -= 160;
     }
     else if((o.get(2).trapX1 - o.get(1).trapX1) < -100){
         o.get(2).trapX1 += 160;
     }
     else if((o.get(2).trapX1 - o.get(0).trapX1) < 100){
         o.get(0).trapX1 -= 160;
     }
     else if((o.get(2).trapX1 - o.get(0).trapX1) < -100){
         o.get(2).trapX1+=160;
     }
     else if(o.get(2).trapX1 > 4000){
         o.get(2).trapX1 -= 400;
     }
     else if(o.get(1).trapX1 > 4000){
         o.get(1).trapX1 -= 400;
     }
     else if(o.get(0).trapX1 > 4000){
         o.get(0).trapX1 -= 400;
     }
     else{
       break;
     }
   }
   
   }
  //Spikes Trigger
  if(mc.posx == 620 && trigS > 0) {
    for(int i = 0; i < 8; i++)
      s.add(new Spikes());
      trigS--;
  }
  //Stalactite Trigger
  if(mc.posx == 1070 && trigSt > 0) {
     for(int i = 0; i < 8; i++)
       st.add(new Stalactite());
     trigSt--; 
  }

  if(mc.posx == 2000 && trigAr > 0) {
    for(int i = 0; i < 10; i++)
      ar.add(new Arrows());
    trigAr--;
    }
  
   
  
  int elapsedTime = millis() - startTime;
  
  int remainingTime = countdownDuration * 1000 - elapsedTime;

  int minutes = floor(remainingTime / 1000.0 / 60.0);
  int seconds = floor((remainingTime / 1000.0) % 60.0);
  String minutes_ = nf(minutes, 2);
  String seconds_ = nf(seconds, 2);
  
  float cameraX = mc.posx + cameraDistance * sin(cameraAngleY) * cos(cameraAngleX);
  float cameraY = mc.posy - cameraDistance * sin(cameraAngleX);
  float cameraZ = mc.posz + cameraDistance * cos(cameraAngleY) * cos(cameraAngleX);

  camera(cameraX, cameraY, cameraZ, mc.posx, mc.posy, mc.posz, 0, 1, 0);
  background(50);
  lights();
  
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  
  text("Use WASD to move the character", 400, mc.posy-50);
  text("To move the camera HOLD left click on mouse and drag", 400, mc.posy-150);
  text("To zoom in and out use arrow keys", 400, mc.posy - 100);
  
  text(minutes_ + ":" + seconds_, mc.posx - 400, mc.posy - 300);
  text("Coins Collected :" + coinCount, mc.posx - 250, mc.posy - 300);
  if(keyAquired)
    text("Key Aquired", mc.posx, mc.posy - 300);
  
  
  push();
  p.pModel();
  pop();
  
  push();
  mc.movement();
  pop();
  
  for(int i = 0;i< c.size(); i++){
    push();
    c.get(i).coinModel();
    pop();
  }
  
  for(int i = 0;i< k.size(); i++){
    push();
    k.get(i).keyModel();
    pop();
  }
 
  for(int i = 0; i < o.size(); i++){
    push();
    o.get(i).oMovement();
    pop();
  }
  
  for(int i = 0; i < s.size(); i++){
    push();
    s.get(i).sMovement();
    pop();
  }
  
  for(int i = 0; i < st.size(); i++){
    push();
    st.get(i).stFall();
    pop();
  }
  for(int i = 0; i < ar.size(); i++){
    push();
    ar.get(i).arFly();
    pop();
  }
  
  collectCoin();
  
  collectKey();
  
  for(int i = 0; i < o.size(); i++){
    gameOver(mc.posx, mc.posy, mc.posz, o.get(i).trapX1, o.get(i).trapY1, o.get(i).trapZ1, 'O');
  }
  
  for(int i = 0; i < s.size(); i++){
    gameOver(mc.posx, mc.posy, mc.posz, s.get(i).trapX2, s.get(i).trapY2, s.get(i).trapZ2, 'S');
  }
  
  for(int i = 0; i < st.size(); i++){
    gameOver(mc.posx, mc.posy, mc.posz, st.get(i).trapX3, st.get(i).trapY3, st.get(i).trapZ3, 'C');
  }
  
  for(int i = 0; i < ar.size(); i++){
    gameOver(mc.posx, mc.posy, mc.posz, ar.get(i).trapX4, ar.get(i).trapY4, ar.get(i).trapZ4, 'A');
  }
  
  gameOverTime(remainingTime);
  gameOverButton(mc.posx, mc.posy);
  score = (remainingTime/1000 * 33) + (coinCount * 137);
  gameFinish(mc.posx, mc.posy, keyAquired, score, 180 - remainingTime / 1000);
}

void keyPressed() {
    if(keyPressed == true){
      if (keyCode == 38){
        if(cameraDistance > 300)
          cameraDistance -= 60;
        }
      else if (keyCode == 40)
        if(cameraDistance < 12000)
          cameraDistance += 60;
    }
  }

void mouseDragged() {
    cameraAngleY += (pmouseX - mouseX) * 0.01;
    cameraAngleX += (pmouseY - mouseY) * 0.01;
}

void collectCoin(){
for(int i = 0;i < c.size(); i++){
   if(mc.posx >= c.get(i).coinX1 - 20 
   && mc.posx <= c.get(i).coinX1 + 20
   && mc.posz >= c.get(i).coinZ1 - 20
   && mc.posz <= c.get(i).coinZ1 + 20){
    coinCount+=1;
    coin.play();
    c.remove(i);
    break;
    }
  }
}

void collectKey(){
  for(int i = 0; i < k.size(); i++){
    if(mc.posx >= k.get(i).keyX - 20 
     && mc.posx <= k.get(i).keyX + 20
     && mc.posz >= k.get(i).keyZ - 20
     && mc.posz <= k.get(i).keyZ + 20){
      k.remove(i);
      keyAquired = true;
      keyAvailable.play();
    }
  }
}
