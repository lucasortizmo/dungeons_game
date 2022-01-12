class Enemy extends GameObject {

  int c;

  Enemy(int _lives, int s, int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = _lives;
    size = s;
    roomX = x;
    roomY = y;
  }

  Enemy(int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    lives = 50;
    size = 50;
    roomX = x;
    roomY = y;
  }

  void show () {
    fill(blue);
    noStroke();
    circle(location.x, location.y, size);
    fill(white);
    textSize(20);
    text(lives, location.x, location.y + 5);
  }

  void act () {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);

      if (obj instanceof Bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d <= size/2 + obj.size/2) {
          lives = lives - ((Bullet)obj).dmg;
          obj.lives = 0;
        }
      }
      i++;
    }
    if (lives <= 0) {
      c = (int(random(0, 3)));
      if (c == 0) myObjects.add(new droppedItem(location.x, location.y, roomX, roomY, SPEED));
      if (c == 1) myObjects.add(new droppedItem(location.x, location.y, roomX, roomY, HEALTH));
      xp++;
      myObjects.add(new XP());
    }
  }
}
