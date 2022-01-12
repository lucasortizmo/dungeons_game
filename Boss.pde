class Boss extends Enemy {

  int bossMode;

  int modeTimer, ibTimer;

  boolean immunity;

  // mode 2 variables
  int shotTimer, threshold;
  float vx, vy;

  color bc;

  Boss (int x, int y) {
    super(600, 100, x, y);

    bossMode = 1;

    shotTimer = 0;
    threshold = 20;

    modeTimer = 0;

    immunity = false;

    bc = #1EF75D;
  }

  void act () {

    location.add(velocity);

    modeCounter();

    if (bossMode == 1) {
      b1();
    }

    if (bossMode == 2) {
      b2();
    }

    if (bossMode == 3) {
      b3();
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);

      if (immunity == false) {
        if (obj instanceof Bullet) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if (d <= size/2 + obj.size/2) {
            lives = lives - ((Bullet)obj).dmg;
            obj.lives = 0;
          }
        }
      }
      i++;
    }

    if (lives <= 0) {
      myObjects.add(new finalBoss(location.x, location.y));
      myObjects.add(new miniBoss(width/2, height/2));
    }
  }

  void show () {
    fill(bc);
    circle(location.x, location.y, size);
    fill(0);
    text(lives, location.x, location.y + 15);
    textSize(50);
  }

  void b1 () {
    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(1);
  }

  void b2 () {

    bc = #F7A41E;

    if (modeTimer >= 120) {
      shotTimer++;
      immunity = false;
      if (shotTimer > threshold) {
        vx = myHero.location.x - location.x;
        vy = myHero.location.y - location.y;
        myObjects.add(0, new enemyBullet(vx, vy, location.x, location.y));
        shotTimer = 0;
      }
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(1);
    } else {
      immunity = true;
      velocity = new PVector(0, 0);
    }
  }

  void b3 () {

    bc = #FF0000;

    if (ibTimer - modeTimer >= 120) {
      shotTimer++;
      immunity = false;
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(1);

      if (shotTimer > threshold + 50) {
        // top bottom left right bullets
        myObjects.add(0, new enemyBullet(0, -1, location.x, location.y));
        myObjects.add(0, new enemyBullet(0, 1, location.x, location.y));
        myObjects.add(0, new enemyBullet(1, 0, location.x, location.y));
        myObjects.add(0, new enemyBullet(-1, 0, location.x, location.y));

        //diagonals
        myObjects.add(0, new enemyBullet(1, -1, location.x, location.y));
        myObjects.add(0, new enemyBullet(1, 1, location.x, location.y));
        myObjects.add(0, new enemyBullet(-1, 1, location.x, location.y));
        myObjects.add(0, new enemyBullet(-1, -1, location.x, location.y));
        shotTimer = 0;
      }
    } else {
      immunity = true;
      velocity = new PVector(0, 0);
    }
  }

  void modeCounter() {

    if (lives <= 400) {
      bossMode = 2;
      modeTimer++;
    }

    if (lives <= 200) {
      bossMode = 3;
      modeTimer = 0;
      ibTimer++;
    }
  }
}
