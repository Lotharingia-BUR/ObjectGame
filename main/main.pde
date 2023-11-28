Ship ship;
Bullet bullet;
BulletSpawner bulletSpawner;

ArrayList<Shot> shotList = new ArrayList<Shot>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
ArrayList<BulletSpawner> spawnerList = new ArrayList<BulletSpawner>();

float shotCooldown;
                      //ST, P, bP, b#, R, x, y, a, r, s 
float[][] spawnList = {{10, 1, 1, 1, 30, 200, 200, 0, 0, 1, 3},
                       {100, 1, 1, 1, 50, 250, 200, 0, 0, 10, 5}};


void setup() {
  size(800, 1000);
  ship = new Ship();
}

void draw(){
  background(255, 255, 255);
  ship.drawShip();
  
  //lower cooldown on shot
  shotCooldown -= 1;
  //move you bullets
  for (int i = 0; i < shotList.size(); i++) {
    Shot select = shotList.get(i);
    select.drawShot();
    if (select.pos.y < 0) {
      shotList.remove(i);
    }
  }
  
  //shoot bullets
  for (int i = 0; i < spawnerList.size(); i++) {
    bulletSpawner = spawnerList.get(i);

    bulletSpawner.drawSpawner();
    bulletSpawner.spawnBullet();
    bulletSpawner.move();

    
    //if out of bounds remove the spawner
    if (bulletSpawner.pos.x > width) {
      println("Out of Bounds!");
      spawnerList.remove(i);
      i--;
    }
    
    //check for shot hit
    for (int ii = 0; ii < shotList.size(); ii++) {
      shot = shotList.get(ii);
      if (checkHit(bulletSpawner.pos, shot.pos, ship.size/4)) {
        bulletSpawner.health--;
        bulletSpawner.hit();
        shot.collide();
        shotList.remove(ii);
      }
    }
    
    //if hurt check fully kill
    if (bulletSpawner.health == 0) {
      spawnerList.remove(i);
      i--;
    }
    //collision dectection
    //write custom function
    
  }
  //spawn new spawners
  for (int i = 0; i < spawnList.length; i++) {
    if (spawnList[i][0] == frameCount) {
      //Build the Bullet
      spawnerList.add(new BulletSpawner(
        spawnList[i][1], spawnList[i][2], spawnList[i][3], 
        spawnList[i][4], spawnList[i][5], spawnList[i][6], 
        spawnList[i][7], spawnList[i][8], spawnList[i][9], 
        spawnList[i][10]));
    }
  }
  
  //Move Bullets
  for (int i = 0; i < bulletList.size(); i++) {
    bullet = bulletList.get(i);
    bullet.drawBullet();
    bullet.move();
  }

  //End State Check
  if (frameCount > 1000 && spawnerList.size() == 0) {
    println("GameEnd");
  }
}

boolean checkHit(PVector pos1, PVector pos2, float size) {
  float colX = pos1.x - pos2.x;
  float colY = pos1.y - pos2.y;
  if (colX > -size && colX < size && colY > -size && colY < size) {
    return true;
  }
  return false;
}

void keyPressed() {
  if (shotCooldown < 0) {
    shotList.add(new Shot(ship.pos.x, ship.pos.y));
    //set how long cooldown is!
    shotCooldown = ship.fireRate;
  }
}
