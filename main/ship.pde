class Ship {
  PVector pos;
  
  void drawShip() {
    pos = new PVector(pmouseX, pmouseY);
    fill(0,0,0);
    rectMode(CENTER);
    rect(pos.x, pos.y, 10, 10);
  }
}
