class Coins{
  float coinX1;
  float coinY1;
  float coinZ1;

  public Coins(){
  randomPosCoins();
  }
  
  void randomPosCoins(){
  coinX1=random(650, 3000);
  coinY1=560;
  coinZ1=random(-180, 180);
  }
  
  void coinModel(){
  noStroke();
  PImage img=loadImage("coin.png");
  PShape coin=createShape(BOX,40,40,2);
  translate(coinX1,coinY1,coinZ1);
  coin.setTexture(img);
  shape(coin);
  }
}

class Key{
  float keyX;
  float keyY;
  float keyZ;
  
  public Key(){
    keyPos();
  }
  
  void keyPos(){
    //Map Boundaries: x:(25, 3973) z:(-220, 220)
    keyX = random(650, 3600);
    keyY = 520;
    keyZ = random(-180, 180);
  }
  
  void keyModel(){
    noStroke();
    PImage keyImg=loadImage("key.png");
    PShape keyShape=createShape(BOX,40,60,4);
    translate(keyX, keyY, keyZ);
    keyShape.setTexture(keyImg);
    shape(keyShape);
  }
}
