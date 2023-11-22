Ship ship;

void setup() {
  size(400, 400);
  ship = new Ship();
}

void draw(){
  background(255, 255, 255);
  ship.drawShip();
}

void keyPressed() {
  ship.shoot();
}
