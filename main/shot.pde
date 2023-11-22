class Shot {
  PVector pos;
  Shot(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void drawShot() {
    fill(0,0,0);
    circle(pos.x, pos.y, 5);
    pos.y -= 1;
    

  }
}
