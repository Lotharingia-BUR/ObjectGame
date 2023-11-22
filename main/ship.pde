class Ship {
  PVector pos;
  void drawShip() {
    pos = new PVector(pmouseX, pmouseY);
    fill(0,0,0);
    rectMode(CENTER);
    rect(pos.x, pos.y, 10, 10);
  }
  
  void shoot() {
    // change to spawn bullet
    // must write that object
    circle(pos.x, pos.y - 20 , 10);
  }
}
