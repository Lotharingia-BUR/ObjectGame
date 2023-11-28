Ship ship;
BulletSpawner bulletSpawner;
ArrayList<Shot> shotList = new ArrayList<Shot>();
float shotCooldown;


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
}

void keyPressed() {
  if (shotCooldown < 0) {
    shotList.add(new Shot(ship.pos.x, ship.pos.y));
    //set how long cooldown is!
    shotCooldown = ship.fireRate;
  }
}
