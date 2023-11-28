class BulletSpawner {
  PVector pos2 = new PVector(0, 0);
  float flyType;
  float bulletType;
  float bulletNumber;
  float fireRate;
  PVector pos;
  float angle;
  float rotation;
  float speed;
  
  BulletSpawner(float flyPattern, float bulletPattern, float bNum, float bFireRate, float x, float y, float angl, float rotat, float sped) {
    flyType = flyPattern;
    bulletType = bulletPattern;
    bulletNumber = bNum;
    fireRate = bFireRate;
    pos = new PVector(x,y);
    angle = angl;
    rotation = rotat;
    speed = sped;
  }
  
  void drawSpawner() {
    noFill();
    rect(pos.x, pos.y, ship.size/4, ship.size/4);
    stroke(100,0,0,50);
    fill(0,0,0);
    ellipse(pos.x, pos.y, ship.size/4, ship.size/4);
  }
  

  
  void spawnBullet() {
    if (frameCount % fireRate == 0) {
      
      println("shot on frame", frameCount);
    }
  }
  
  //(distance/int(loc.substring(2))
  
  void move() {
    pos.add(pos2);
  }
  //create function for determing angle to add to pvector
}
