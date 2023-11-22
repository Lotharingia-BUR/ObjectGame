class Shot {
  PVector pos;
  Shot(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void drawShot() {
    fill(0,0,0);
    ellipse(pos.x-ship.size/3, pos.y - ship.size/2, 5, 10);
    ellipse(pos.x+ship.size/3, pos.y - ship.size/2, 5, 10);
    pos.y -= 20;
    

  }
}
