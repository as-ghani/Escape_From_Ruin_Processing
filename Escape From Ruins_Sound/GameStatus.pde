void gameOver(float posx, float posy, float posz, float trapX, float trapY, float trapZ, char type){

  switch(type){
    //Game Over condition for Spikes
    case 'S':
      if(posy >= trapY - 70 && 
         posx >= trapX - 40 && posx <= trapX + 40 && 
         posz >= trapZ - 40 && posz <= trapZ + 40){
         lose.play();
        noLoop();
        background(0);
        textSize(50);
        textAlign(CENTER, CENTER);
        fill(255, 255, 255);
        text("Game Over", posx, posy - 50);
      }
      break;
      
    //Game Over condition for Stalactite
    case 'C':
      if(posy <= trapY + 100 && posy >= trapY - 50 &&
         posx <= trapX + 40 && posx >= trapX - 40 && 
         posz <= trapZ + 40 && posz >= trapZ - 40){
         lose.play();
        noLoop();
        background(0);
        textSize(50);
        textAlign(CENTER, CENTER);
        fill(255, 255, 255);
        text("Game Over", posx, posy - 50);
      }
     break;
    
    //Game Over condition for Arrow
    case 'A':
      if(posx >= trapX - 10 && posx <= trapX + 10 &&
         posz >= trapZ - 30 && posz <= trapZ + 30){
         lose.play();
        noLoop();
        background(0);
        textSize(50);
        textAlign(CENTER, CENTER);
        fill(255, 255, 255);
        text("Game Over", posx, posy - 50);
      }
    break;
    
    //Game Over condition for Magic Orbs
    case 'O':
      if(posx >= trapX - 20 && posx <= trapX + 20 &&
         posz >= trapZ - 20 && posz <= trapZ + 20){
         lose.play();
        noLoop();
        background(0);
        textSize(50);
        textAlign(CENTER, CENTER);
        fill(255, 255, 255);
        text("Game Over", posx, posy - 50);
      }
    break;
  }
}

void gameOverTime(int time)
{
  if (time <= 0) {
    lose.play();
    noLoop();
    background(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("Game Over", mc.posx, mc.posy - 50);
    text("You Failed to Escape" ,mc.posx,mc.posy+95);
  }
}

void gameOverButton(float posx, float posy){
  if(keyPressed == true){
    if(key == 'p'){
      lose.play();
      noLoop();
      background(0);
      textSize(50);
      textAlign(CENTER, CENTER);
      fill(255, 255, 255);
      text("Game Over", posx, posy - 50);
      text("Nani?! Seppuku!", posx, posy + 20);
    }
  }
}

void gameFinish(float posx, float posy, boolean keyPossesion, int score, int time){

  if (keyPossesion && posx > 3850){
    won.play();
    noLoop();
    background(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("You Have Escaped from Ruins", posx, posy -50);
    text("Your Score : " + score, posx, posy + 20);
    text("You Have Escaped in : " + time + " Seconds", posx, posy + 70);
  }
}
