class BulletSpawner {
  PVector pos2;
  float flyType;
  float bulletType;
  float bulletNumber;
  float fireRate;
  PVector pos;
  float angle;
  float rotation;
  float speed;
  float health;
  
  BulletSpawner(
    float flyPattern, float bulletPattern, float bNum, 
    float bFireRate, float x, float y, float angl, 
    float rotat, float sped, float hp) {
    flyType = flyPattern;
    bulletType = bulletPattern;
    bulletNumber = bNum;
    fireRate = bFireRate;
    pos = new PVector(x,y);
    pos2 = new PVector(0,0);
    angle = angl;
    rotation = rotat;
    speed = sped;
    health = hp;
  }
  
  void drawSpawner() {
    noFill();
    rect(pos.x, pos.y, 20, 20);
    stroke(100,0,0,50);
    fill(0,0,0);
    ellipse(pos.x, pos.y, 20, 20);
  }

  void spawnBullet() {
    if (frameCount % fireRate == 0) {
      switch(int(bulletType)) {
        case 0:
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, 0, rotation, 5));
          break;
        case 1:
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, HALF_PI, 0+rotation, 5));
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, HALF_PI, 0-rotation, 5));
          
      }
      //println("shot on frame", frameCount);
    }
  }
  
  //(distance/int(loc.substring(2))
  
  void move() {
    pos2.set(speed*cos(angle), speed*sin(angle));
    pos.add(pos2);
  }
  
  void hit() {
    noFill();
    rect(pos.x, pos.y, ship.size/4, ship.size/4);
    stroke(100,0,0,50);
    fill(200,0,0);
    ellipse(pos.x, pos.y, ship.size/4, ship.size/4);
  }
  //create function for determing angle to add to pvector
  
}
