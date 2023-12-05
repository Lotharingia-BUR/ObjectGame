class BulletSpawner {
  PVector pos2;
  PVector pos;
  float sprite;
  float bulletType;
  float bulletNumber;
  float fireRate;
  float angle;
  float rotation;
  float speed;
  float health;
  float bulletSpeed;
  
  BulletSpawner(
    float spawnerSprite, float bulletPattern, float bNum, 
    float bFireRate, float x, float y, float angl, 
    float rotat, float sped, float hp, float bSped) {
    sprite = spawnerSprite;
    bulletType = bulletPattern;
    bulletNumber = bNum;
    fireRate = bFireRate;
    pos = new PVector(x,y);
    pos2 = new PVector(0,0);
    angle = angl;
    rotation = rotat;
    speed = sped;
    health = hp;
    bulletSpeed = bSped;
  }
  
  void drawSpawner() {
    stroke(50,200,0, 100);
    strokeWeight(1);
    fill(100,200,0, 100);
    ellipse(pos.x, pos.y, 20, 20);
    fill(100,200,0);
    ellipse(pos.x, pos.y, 11, 11);
    fill(0, 0, 0);
    stroke(0, 0, 0, 80);
    switch(int(sprite)) {
      case 0:
        ellipse(pos.x, pos.y, 11, 5);
        fill(100,200,0, 100);
        ellipse(pos.x, pos.y, 2, 5);
        break;
      case 1:
        ellipse(pos.x-3, pos.y, 4, 2);
        ellipse(pos.x+3, pos.y, 4, 2);
        break;
      case 2:
        ellipse(pos.x-3, pos.y, 2, 2);
        ellipse(pos.x+3, pos.y, 2, 2);
        ellipse(pos.x, pos.y-3, 2, 2);
        ellipse(pos.x, pos.y+3, 2, 2);
        break;
      case 3:
        ellipse(pos.x, pos.y, 11, 2);
        ellipse(pos.x, pos.y, 2, 11);
        break;
    }    
  }

  void spawnBullet() {
    if (frameCount % fireRate == 0) {
      switch(int(bulletType)) {
        case 0:
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, 0, rotation, bulletSpeed));
          break;
        case 1:
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, HALF_PI, 0+rotation, bulletSpeed));
          bulletList.add(new Bullet(pos.x, pos.y, bulletType, HALF_PI, 0-rotation, bulletSpeed));
          break;
         case 2:
           for (int i = 0; i < bulletNumber; i++) {
             bulletList.add(new Bullet(pos.x, pos.y, bulletType, angle + (2*PI/bulletNumber * i), rotation, 5));
           }
           break;
          
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
    stroke(100,0,0,50);
    fill(200,0,0);
    ellipse(pos.x, pos.y, 10, 10);
    frameRate(35);
  }
  //create function for determing angle to add to pvector
  
}
