class follower extends Enemy {

  follower(int x, int y) {
    super(enemyLives, enemySize, x, y);
  }

  void show () {
    fill(black);
    noStroke();
    circle(location.x, location.y, size);
    fill(white);
    textSize(20);
    text(lives, location.x, location.y + 5);
  }

  void act () {
    super.act();

    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(2);
  }
}
