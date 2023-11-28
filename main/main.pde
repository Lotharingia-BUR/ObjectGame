Ship ship;
BulletSpawner bulletSpawner;
ArrayList<Shot> shotList = new ArrayList<Shot>();
ArrayList<BulletSpawner> spawnerList = new ArrayList<BulletSpawner>();
float shotCooldown;
                      //ST, P, bP, b#, R, x, y, a, r, s 
float[][] spawnList = {{10, 1, 1, 1, 10, 200, 200, 0, 0, 1},
                       {100, 1, 1, 1, 10, 250, 200, 0, 0, 1}};


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
    
  }
  //spawn new spawners
  for (int i = 0; i < spawnList.length; i++) {
    if (spawnList[i][0] == frameCount) {
      //Build the Bullet
      spawnerList.add(new BulletSpawner(spawnList[i][1], spawnList[i][2], spawnList[i][3], 
                                        spawnList[i][4], spawnList[i][5], spawnList[i][6], 
                                        spawnList[i][7], spawnList[i][8], spawnList[i][9]));
     //Something
    }
  }
  

}

void keyPressed() {
  if (shotCooldown < 0) {
    shotList.add(new Shot(ship.pos.x, ship.pos.y));
    //set how long cooldown is!
    shotCooldown = ship.fireRate;
  }
}
