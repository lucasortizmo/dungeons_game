class turret extends Enemy {

  int shotTimer, threshold;
  float vx, vy;

  turret (int x, int y) {
    super(x, y);
    shotTimer = 0;
    threshold = 20;
    location = new PVector(width/2, height/2);
    velocity = new PVector(vx, vy);
  }

  void act () {

    super.act();

    // shot velocity
    shotTimer++;
    if (shotTimer > threshold) {
      vx = myHero.location.x - location.x;
      vy = myHero.location.y - location.y;
      myObjects.add(0, new enemyBullet(vx, vy, location.x, location.y));
      shotTimer = 0;
    }
  }
}
