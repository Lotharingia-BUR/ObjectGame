class Ship {
  PVector pos;
  float border = 15;
  float size = 80;
  void drawShip() {
    pos = new PVector(constrain(pmouseX, 0 + border , width - border), constrain(pmouseY, 0 + border, height  - border));
    fill(0,0,0);
    rectMode(CENTER);

    noStroke();
    fill(200,200,200);
    triangle(pos.x, pos.y-size/3, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x-size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x+size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    fill(150,150,150); // Grey
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    fill(0,0,0);
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    fill(200,0,0);
    rect(pos.x, pos.y, 2, 2);
    stroke(200,0,0);
    noFill();
    rect(pos.x, pos.y, size/3, size);
    
    
  }
  
  void shoot() {
    // change to spawn bullet
    // must write that object
    circle(pos.x, pos.y - 20 , 10);
  }
}
