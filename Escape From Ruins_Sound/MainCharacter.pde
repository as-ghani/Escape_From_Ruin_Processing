class Character{
  float posx;
  float posy;
  float posz;
  
  Character(){
    posx = 500;
    posy = 540;
    posz = 0;
  }
  
  void model(){
    stroke(1);
    translate(posx, posy, posz);
    fill(232, 190, 172); //head and legs
    box(30, 60, 30);
    fill(255, 0, 0); //cloth
    box(40, 40, 40);
    fill(232, 190, 172); //arms
    box(10, 30, 50);
    
    keyPressed();
  }
  
  void movement(){
    model();
    if(keyPressed == true){
      //Map Boundaries: x:(25, 3973) z:(-220, 220)
      if(key == 'w' && posz > -180){
        posz -= 15;
      }
      
      else if(key == 's' && posz < 180){
        posz += 15;
      }

      else if(key == 'a' && posx > 100){
        posx -= 15;
      }

      else if(key == 'd' && posx < 3900){
        posx += 15;
      }
    }
  }
}
