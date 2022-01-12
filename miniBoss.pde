class miniBoss extends Enemy {

  // movement variables
  float vx, vy;

  miniBoss(float x, float y) {
    super(10, 30, 8, 8);

    location = new PVector (x, y);
    velocity = new PVector (random(-1, 1), random(-1, 1));
  }

  void show () {
    fill(255, 0, 0);

    // 1rst layer
    circle(location.x, location.y, size);

    circle(location.x - 150, location.y, size);

    circle(location.x + 150, location.y, size);

    circle(location.x, location.y - 150, size);

    circle(location.x, location.y + 150, size);

    circle(location.x - 150, location.y - 150, size);

    circle(location.x + 150, location.y + 150, size);

    circle(location.x - 150, location.y + 150, size);

    circle(location.x + 150, location.y - 150, size);

    // second layer

    circle(location.x, location.y, size);

    circle(location.x - 300, location.y, size);

    circle(location.x + 300, location.y, size);

    circle(location.x, location.y - 300, size);

    circle(location.x, location.y + 300, size);

    circle(location.x - 300, location.y - 300, size);

    circle(location.x + 300, location.y + 300, size);

    circle(location.x - 300, location.y + 300, size);

    circle(location.x + 300, location.y - 300, size);
  }


  void act () {
    location.add(velocity);

    super.act();

    if (location.x > width*0.9 - 20 - size/2) velocity = new PVector (-1, random(-1, 1));
    if (location.x < width*0.1 + 20 + size/2) velocity = new PVector (1, random(-1, 1));
    if (location.y > height*0.9 - 20 - size/2) velocity = new PVector (random(-1, 1), -1);
    if (location.y < height*0.1 + 20 + size/2) velocity = new PVector (random(-1, 1), 1);
  }
}
