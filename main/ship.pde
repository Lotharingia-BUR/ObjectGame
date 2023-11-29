Shot shot;
class Ship {
  PVector pos;
  float border = 20;
  float size;
  float fireRate;
  
  //stating stats
  Ship(){
   size = 40;
   fireRate = 5;
  }
  void drawShip() {
    pos = new PVector(constrain(pmouseX, 0 + border , width - border), constrain(pmouseY, 0 + border, height  - border)); 
    //Draw the ship and hitbox
    noStroke();
    rectMode(CENTER);
    fill(200,200,200); // Light Grey
    triangle(pos.x, pos.y-size/3, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x-size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x+size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    fill(150,150,150); // Grey
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    fill(0,0,0); // Black
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    fill(200,0,0,150); // Red
    rect(pos.x, pos.y, size/10, size/10);
    stroke(100,0,0,50); // Red
    noFill();
    rect(mouseX, mouseY, size/3, size); 
  }
}
