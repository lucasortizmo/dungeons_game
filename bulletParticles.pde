class bulletParticles extends GameObject {

  // instance variables
  float w; // random particle size
  int t; // transparency
  PVector nudge;
  PVector direction;

  // constructor
  bulletParticles (float x, float y, float vx, float vy) {
    t = 255;
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
    size = 5;
    velocity.rotate(random(-360, 360));
    vx = (random(-1, 1));
    vy = (random(-1, 1));

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  // behaviour functions
  void show () {

    // particles visual
    fill(black, t);
    square(location.x, location.y, size);
  }

  void act () {
    super.act();

    // particle transparency timer
    t = t - 10;
    if (t <= 0) lives = 0;
  }
}
