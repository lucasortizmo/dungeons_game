class droppedItem extends GameObject {

  int type;

  droppedItem (float x, float y, int rx, int ry, int t) {
    type = t;
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 30;
    roomX = rx;
    roomY = ry;
  }

  void show () {

    if (type == HEALTH) {
      stroke(black);
      strokeWeight(2);
      fill(255);
      circle(location.x, location.y, size);
      fill(255, 0, 0);
      stroke(255, 0, 0);
      strokeWeight(3);
      line(location.x - size/2 + 2, location.y, location.x + size/2 - 2, location.y);
      line(location.x, location.y - size/2 + 2, location.x, location.y + size/2 - 2);
    }

    if (type == SPEED) {
      image(bunny, location.x, location.y, size, size);
    }
  }

  void act () {
  }
}
