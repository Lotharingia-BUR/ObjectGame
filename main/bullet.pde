class Bullet {
  PVector pos2;
  PVector pos;
  int pattern;
  float angle;
  float rotation;
  float speed;
  
  int frames = 0;
  
  Bullet(float x, float y, float pat, float angl, float rotat, float sped) {
    pos = new PVector(x, y);
    pos2 = new PVector(0, 0);
    pattern = int(pat);
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

  void changeDirection() {
    //cos and sin make new pvector
    //distance set to speed
    switch(pattern) {
      //face player
      case -1:
        break;
      case 0:
        println("b");
        angle = atan((pos.y - ship.pos.y)/(pos.x - ship.pos.x));
        if (pos.x > ship.pos.x) {
          angle -= PI;
        }
        pattern = 1;
        break;
      case 1:
        break;
    }
    angle += rotation;
    pos2.set(speed*cos(angle), speed*sin(angle));
  }
  
  void move() {
    pos.add(pos2);
    frames++;
    
  }
}
