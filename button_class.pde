class Button {
  int x, y, w, h;
  String text;
  color normal, highlights;
  boolean clicked;
  int ts;
  int rs;

  Button (int _x, int _y, int _w, int _h, String t, color norm, color highlight, int _ts, int _rs) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    ts = _ts;
    rs = _rs;

    clicked = false;

    text = t;
    normal = norm;
    highlights = highlight;
  }

  void show () {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      stroke(highlights);
      strokeWeight(3);
      fill(normal);
      rect(x, y, w, h, rs);
      fill(highlights);
      textFont(dun);
      textSize(ts);
      text(text, x + w/2, y + h/2 + 15);
    } else {
      stroke(normal);
      strokeWeight(3);
      fill(highlights);
      rect(x, y, w, h, rs);
      fill(normal);
      textFont(dun);
      textSize(ts);
      text(text, x + w/2, y + h/2 + 15);
    }

    clicked = (mouseReleased == true && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
  }
}

void click () {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
