class BulletSpawner {
  String flyType;
  String bulletType;
  int bulletNumber;
  float fireRate;
  PVector pos;
  float angle;
  float rotation;
  float speed;
  
  BulletSpawner(String flyPattern, String bulletPattern, int bNum, float bFireRate, float x, float y, float angl, float rotat, float sped) {
    flyType = flyPattern;
    bulletType = bulletPattern;
    bulletNumber = bNum;
    fireRate = bFireRate;
    pos = new PVector(x,y);
    angle = angl;
    rotation = rotat;
    speed = sped;
  }
  
  void spawnBullet() {
    if (frameCount % 14 == 0) {
    println("shoot", frameCount);
  }
  }
}
