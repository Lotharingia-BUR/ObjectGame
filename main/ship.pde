Shot shot;
class Ship {
  PVector pos;
  float border = 20;
  float size;
  float fireRate;
  float health;
  
  //stating stats
  Ship(){
   size = 40;
   fireRate = 5;
   health = 3;
  }
  
  // draw ship
  void drawShip() {
    pos = new PVector(constrain(pmouseX, 0 + border , width - border), constrain(pmouseY, 0 + border, height  - border)); 
    //Draw the ship and hitbox
    noStroke();
    rectMode(CENTER);
    
    fill(200,100,100); // red
    stroke(200,100,100);
    triangle(pos.x, pos.y-size/3, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x-size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x+size/3, pos.y+size/2, pos.x-size/2, pos.y+size/3, pos.x+size/2, pos.y+size/3);
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y-size/3, pos.x+size/4, pos.y-size/3);
    
    fill(200,200,200); // Light Grey
    stroke(200,200,200);
    triangle(pos.x, pos.y-size/3, pos.x-size/2+3, pos.y+size/3, pos.x+size/2-3, pos.y+size/3);
    triangle(pos.x-size/3, pos.y+size/2, pos.x-size/2+3, pos.y+size/3, pos.x+size/2-3, pos.y+size/3);
    triangle(pos.x+size/3, pos.y+size/2, pos.x-size/2+3, pos.y+size/3, pos.x+size/2-3, pos.y+size/3);
    
    fill(180,180,180); // Grey
    stroke(180,180,180);
    triangle(pos.x, pos.y+size/2, pos.x-size/4+3, pos.y-size/3, pos.x+size/4-3, pos.y-size/3);
    triangle(pos.x, pos.y-size/2, pos.x-size/4+3, pos.y-size/3, pos.x+size/4-3, pos.y-size/3);
    
    fill(160,160,160); // Black
    stroke(160,160,160);
    triangle(pos.x, pos.y-size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    triangle(pos.x, pos.y+size/2, pos.x-size/4, pos.y+size/3, pos.x+size/4, pos.y+size/3);
    
    fill(220,220,220); // white
    stroke(220,220,220);
    triangle(pos.x, pos.y-size/2, pos.x-size/4+5, pos.y+size/3, pos.x+size/4-5, pos.y+size/3);
    triangle(pos.x, pos.y+size/2, pos.x-size/4+5, pos.y+size/3, pos.x+size/4-5, pos.y+size/3);
    
    fill(200,0,0,150); // Red
    rect(pos.x, pos.y, size/10, size/10);
  }
}
