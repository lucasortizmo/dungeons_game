class enemyBullet extends GameObject {

  // instance variables
  int timer; // shot range

  // constructor
  enemyBullet (float vx, float vy, float x, float y) {
    timer = 100;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    velocity.setMag(5);
    size = 10;

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  // behaviour functions
  void show () {

    // bullet visual
    noStroke();
    fill(255, 0, 0);
    circle(location.x, location.y, size);
  }

  void act () {
    super.act();
  }
}
