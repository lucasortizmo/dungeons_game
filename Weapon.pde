class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;

  Weapon () {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 10;
  }

  Weapon (int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }

  void update () {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector (mouseX - myHero.location.x, mouseY - myHero.location.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(0, new Bullet(aimVector, black, bulletSize, bulletSpeed + dmgUpgrade));
      shotTimer = 0;
    }
  }
}
