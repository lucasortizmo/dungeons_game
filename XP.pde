class XP extends GameObject {

  // showTimer
  int showTimer;

  XP () {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    lives = 1;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    showTimer = 255;
  }

  void show () {
    fill(blue, showTimer);
    text("+1 XP", location.x, location.y);
  }

  void act () {
    showTimer = showTimer - 3;
  }
}
