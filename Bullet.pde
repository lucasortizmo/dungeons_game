class Bullet extends GameObject {

  int dmg;
  color c;

  Bullet (PVector _velocity, color _c, int _s, int _dmg) {

    dmg = _dmg;
    lives = 1;
    c = _c;
    size = _s;
    velocity = _velocity;
    location = new PVector (myHero.location.x, myHero.location.y);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show () {
    fill(c);
    noStroke();
    circle(location.x, location.y, size);

    if (location.x >= width * 0.9 - 20 - size  || location.x <= width * 0.1 + 20 + size || location.y >= height * 0.9 - 20 - size || location.y <= height * 0.1 + 20 + size) {

      lives = 0;

      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
      myObjects.add(new bulletParticles(location.x, location.y, velocity.x, velocity.y));
    }
  }
}
