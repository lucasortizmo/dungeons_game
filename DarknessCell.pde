class DarknessCell {
  float opacity;
  float x, y, size;
  float dis;

  DarknessCell (float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 255;
  }

  void show () {

    noStroke();
    dis = dist(x, y, myHero.location.x, myHero.location.y);
    opacity = map(dis, 0, 300, 0, 255);
    fill(black, opacity);
    square(x, y, size);
  }

  void act () {
  }
}
