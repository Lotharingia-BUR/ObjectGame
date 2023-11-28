class Bullet {
  PVector pos;
  float pattern;
  float angle;
  float rotation;
  float speed;
  
  Bullet(float x, float y, float angl, float rotat, float sped) {
    pos = new PVector(x, y);
    angle = angl;
    rotation = rotat;
    speed = sped;
  }
  
  void drawBullet() {
    noStroke();
    fill(0,200,0,100);
    ellipse(pos.x, pos.y, 15, 15);
    fill(0,200,0);
    stroke(0,100,0);
    ellipse(pos.x, pos.y, 5, 5);
  }
  
  void move() {
    pos.y += speed;
  }
}
