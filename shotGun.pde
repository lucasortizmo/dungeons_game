class shotGun extends Weapon {

  shotGun() {
    super(shotThresh, shotBs);
  }

  void shoot () {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 5; i++) {
        PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
        aimVector.rotate(random(-PI/7, PI/7));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, black, 10, bulletSpeed));
      }
      shotTimer = 0;
    }
  }
}
