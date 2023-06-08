class Platform{
  float plx;
  float ply;
  float plz;

  PImage img = loadImage("dungeon_wall.jpg");
  PImage img1 = loadImage("dungeon_floor.jpg");
  PImage img2 = loadImage("gate.jpg");
  PShape wallN = createShape(BOX, 4000, 500, 2);
  PShape wallE = createShape(BOX, 2, 500, 500);
  PShape wallW = createShape(BOX, 2, 500, 500);
  PShape ceilling = createShape(BOX, 4000, 2, 500);
  PShape floor = createShape(BOX, 4000, 2, 500);

  Platform(){
    plx = 1000;
    ply = 573;
    plz = 0;
  }

  void pModel(){
    stroke(1);
    fill(170, 74, 68);

    //Floor
    push();
    translate(plx + 1000, ply, plz);
    floor.setTexture(img1);
    shape(floor);
    pop();

    //Ceilling
    push();
    translate(plx + 1000, ply - 500, plz);
    ceilling.setTexture(img);
    shape(ceilling);
    pop();

    //WallNorth
    push();
    translate(plx + 1000, ply - 250, plz - 250);
    wallN.setTexture(img);
    shape(wallN);
    pop();

    //WallWest
    push();
    translate(plx - 1000, ply - 250, plz);
    wallW.setTexture(img);
    shape(wallW);
    pop();

    //WallEast
    push();
    translate(plx + 3000, ply - 250, plz);
    wallE.setTexture(img2);
    shape(wallE);
    pop();
  }
}
