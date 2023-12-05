Ship ship;
Bullet bullet;
BulletSpawner bulletSpawner;

ArrayList<Shot> shotList = new ArrayList<Shot>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
ArrayList<BulletSpawner> spawnerList = new ArrayList<BulletSpawner>();
int score = 0;
int waveCount = 0;
int wave = 0;

float shotCooldown;
//starting wave
//ST, P, bP, b#, R, x, y, a, r, s, hp
float[][] spawnList = {
  {50, 0, 0, 1, 10, 150, 0, HALF_PI, 0, 2.4, 2, 4},
  {70, 0, 0, 1, 10, 150, 0, HALF_PI, 0, 2.4, 2, 4},
  {90, 0, 0, 1, 10, 150, 0, HALF_PI, 0, 2.4, 2, 4},
  {150, 0, 0, 1, 10, 650, 0, HALF_PI, 0, 2.4, 2, 4},
  {170, 0, 0, 1, 10, 650, 0, HALF_PI, 0, 2.4, 2, 4},
  {190, 0, 0, 1, 10, 650, 0, HALF_PI, 0, 2.4, 2, 4},
  {250, 1, 1, 1, 10, 300, 0, HALF_PI, 0.005, 1.2, 2, 4},
  {250, 1, 1, 1, 10, 500, 0, HALF_PI, 0.005, 1.2, 2, 4},
  {250, 1, 1, 1, 20, 400, 0, HALF_PI, 0.001, 1.2, 2, 4},
  };

void setup() {
  size(800, 1000);
  noCursor();
  ship = new Ship();
}

void draw(){
  frameRate(40);
  background(20, 0, 55);
  ship.drawShip();
  ship.size = 40;
  
  //State check, create new waves when cleared
  if (frameCount > 400 && wave == 0 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 20, 0, 0, 1, 10, 100, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 20, 0, 0, 1, 10, 400, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 20, 0, 0, 1, 10, 700, 0, HALF_PI, 0, 1.2, 5, 6},
    };
    wave = 1;
  } else if (frameCount > waveCount + 100 && wave == 1 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 20, 0, 0, 1, 10, 100, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 20, 0, 0, 1, 10, 400, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 20, 0, 0, 1, 10, 700, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 80, 0, 0, 1, 10, 200, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 80, 0, 0, 1, 10, 300, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 80, 0, 0, 1, 10, 500, 0, HALF_PI, 0, 1.2, 5, 6},
    {waveCount + 80, 0, 0, 1, 10, 600, 0, HALF_PI, 0, 1.2, 5, 6},
    };
    wave = 2;
  } else if (frameCount > waveCount + 100 && wave == 2 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 20, 3, 1, 1, 10, 0, 0, QUARTER_PI, 0, 3, 2, 6},
    {waveCount + 40, 3, 1, 1, 10, 0, 0, QUARTER_PI, 0, 3, 2, 6},
    {waveCount + 60, 3, 1, 1, 10, 0, 0, QUARTER_PI, 0, 3, 2, 6},
    {waveCount + 20, 3, 1, 1, 10, 800, 50, PI, 0.001, 2, 5, 6},
    {waveCount + 40, 3, 1, 1, 10, 800, 50, PI, 0.001, 2, 5, 6},
    {waveCount + 60, 3, 1, 1, 10, 800, 50, PI, 0.001, 2, 5, 6},
    {waveCount + 80, 0, 0, 1, 40, 400, 10, HALF_PI, 0, 1.2, 5, 6},
    };
    wave = 3;
  } else if (frameCount > waveCount + 21 && wave == 3 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 60, 2, 2, 10, 15, 400, 0, HALF_PI, 0.004, 0.5, 10, 3},
    {waveCount + 70, 2, 2, 14, 15, 250, 0, HALF_PI, 0.006, 0.5, 10, 3},
    {waveCount + 70, 2, 2, 14, 15, 550, 0, HALF_PI, 0.006, 0.5, 10, 3},
    };
    wave = 4;
  } else if (frameCount > waveCount + 61 && wave == 4 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 60, 2, 2, 80, 20, 700, 50, HALF_PI, 0.007, 0.1, 5, 1.5},
    {waveCount + 60, 0, 0, 1, 40, 220, 50, HALF_PI, 0.000, 0.1, 5, 10},
    {waveCount + 60, 0, 0, 1, 40, 280, 70, HALF_PI, 0.000, 0.1, 5, 10},
    {waveCount + 60, 0, 0, 1, 40, 260, 20, HALF_PI, 0.000, 0.1, 5, 10},
    };
    wave = 5;
  } else if (frameCount > waveCount + 62 && wave == 5 && spawnerList.size() == 0) {
    waveCount = frameCount;
    spawnList = new float[][] {
    {waveCount + 60, 2, 2, 40, 30, 400, 50, HALF_PI, 0.000, 0.5, 5, 1.5},
    {waveCount + 70, 2, 2, 40, 30, 250, 100, HALF_PI, 0.008, 0.5, 5, 1.5},
    {waveCount + 70, 2, 2, 40, 30, 550, 100, HALF_PI, 0.008, 0.5, 5, 1.5},
    };
    wave = 6;
  } else if (frameCount > waveCount + 63 && wave == 6 && spawnerList.size() == 0) {
    textSize(80);
    textAlign(CENTER);
    text("you win!", 400, 320); 
    text(("score: " + score), 400, 400);
    waveCount = -64;
    wave = 6;
    reset();
  }
  
  //Move Bullets
  for (int i = 0; i < bulletList.size(); i++) {
    bullet = bulletList.get(i);
    bullet.drawBullet();
    //check for hit on ship
    if (checkHit(ship.pos, bullet.pos, ship.size/8)) {
      ship.health--;
      //ship.hit();
      bulletList.remove(i);
    }
    bullet.changeDirection();
    bullet.move();
    if (bullet.frames > 500) {
      bulletList.remove(i);
    }
  }  
    
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
    bulletSpawner.spawnBullet();
    bulletSpawner.drawSpawner();
    bulletSpawner.move();

    
    //if out of bounds remove the spawner
    if (bulletSpawner.pos.x > width+20 || bulletSpawner.pos.x < -20 || bulletSpawner.pos.y > height+20 ||bulletSpawner.pos.y < -20) {
      spawnerList.remove(i);
    }
    
    //check for shot hit
    for (int ii = 0; ii < shotList.size(); ii++) {
      shot = shotList.get(ii);
      if (checkHit(bulletSpawner.pos, shot.pos, 20)) {
        bulletSpawner.health--;
        bulletSpawner.hit();
        shot.collide();
        shotList.remove(ii);
        ii--;
      }
    }
    
    //if hurt check fully kill
    if (bulletSpawner.health == 0) {
      spawnerList.remove(i);
      i--;
    } 
  }
  
  //spawn new spawners
  for (int i = 0; i < spawnList.length; i++) {
    if (spawnList[i][0] == frameCount) {
      //Build the Bullet
      spawnerList.add(new BulletSpawner(
        spawnList[i][1], spawnList[i][2], spawnList[i][3], 
        spawnList[i][4], spawnList[i][5], spawnList[i][6], 
        spawnList[i][7], spawnList[i][8], spawnList[i][9], 
        spawnList[i][10],spawnList[i][11]));
    }
  }
  
  //UI
  fill(0,0,0);
  textAlign(LEFT);
  textSize(20);
  text(("health " + int(ship.health)), 0, 20);
  text(score, 0, 40);
  
  //if no health, die
  if (ship.health < 1) {
    reset();
  }
  
  //start game text
  if (frameCount == 1) {
    frameCount = 0;
    fill(240,240,240);
    textSize(70);
    textAlign(CENTER);
    ship.size = 80;
    text("press 'r' to start", 400, 600);
    textSize(50);
    text("press any key to shoot", 400, 650);
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

//reset screen
void reset() {
  frameCount = 1;
  spawnerList.clear();
  bulletList.clear();
  spawnList = new float [][]{
  {50, 0, 0, 1, 10, 150, 1, HALF_PI, 0, 2.4, 2, 4},
  {70, 0, 0, 1, 10, 150, 1, HALF_PI, 0, 2.4, 2, 4},
  {90, 0, 0, 1, 10, 150, 1, HALF_PI, 0, 2.4, 2, 4},
  {150, 0, 0, 1, 10, 650, 1, HALF_PI, 0, 2.4, 2, 4},
  {170, 0, 0, 1, 10, 650, 1, HALF_PI, 0, 2.4, 2, 4},
  {190, 0, 0, 1, 10, 650, 1, HALF_PI, 0, 2.4, 2, 4},
  {250, 1, 1, 1, 10, 300, 1, HALF_PI, 0.005, 1.2, 2, 4},
  {250, 1, 1, 1, 10, 500, 1, HALF_PI, 0.005, 1.2, 2, 4},
  {250, 1, 1, 1, 20, 400, 1, HALF_PI, 0.001, 1.2, 2, 4},
  };
}

void keyPressed() {
  if (frameCount == 0 && key == 'r') {
    ship = new Ship();
    frameCount = 1;
    wave = 0;
    score = 0;
  } else if (shotCooldown < 0) {
    shotList.add(new Shot(ship.pos.x, ship.pos.y));
    //set how long cooldown is!
    shotCooldown = ship.fireRate;
  }
}
