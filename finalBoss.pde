class finalBoss extends Enemy {

  int shotTimer, threshold;
  float vx, vy;

  finalBoss(float x, float y) {
    super(1000, 100, 8, 8);

    location = new PVector (x, y);
    velocity = new PVector(0, 0);

    shotTimer = 0;
    threshold = 20;
  }

  void show () {
    fill(255, 0, 0);
    circle(location.x, location.y, size);
    fill(black);
    text(lives, location.x, location.y + 15);
    textSize(50);
  }

  void act () {
    super.act();

    velocity = new PVector (myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(1);

    shotTimer++;
    if (shotTimer > threshold) {
      vx = myHero.location.x - location.x;
      vy = myHero.location.y - location.y;
      myObjects.add(0, new enemyBullet(vx, vy, location.x, location.y));
      shotTimer = 0;
    }

    if (lives <= 0) {
      win = true;
      mode = GAMEOVER;
    }
  }
}
