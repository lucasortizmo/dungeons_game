class Animatedgif {
  // instance variables
  PImage[] pics;
  int numFrames;
  int currentFrame;
  float x, y, w, h;
  int rate;

  // constructor
  Animatedgif (int nf, int r, String pre, String post) {
    x = 0;
    y = 0;
    w = width;
    h = height;
    rate = r;
    pics = new PImage [nf];
    int i = 0;
    while (i < nf) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    numFrames = nf;
  }

  Animatedgif (int nf, int r, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    rate = r;

    pics = new PImage [nf];
    int i = 0;
    while (i < nf) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  // behaviour functions
  void show (float x, float y, float w, float h) {
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % rate == 0) currentFrame++;
  }

  void show () {
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], 0, 0, width, height);
    if (frameCount % rate == 0) currentFrame++;
  }
}
