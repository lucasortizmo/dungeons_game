import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

// dropped item types
final int HEALTH = 0;
final int SPEED = 1;

// sound variables
Minim minim;
AudioPlayer game;

// mouse variables
boolean mouseReleased;
boolean wasPressed;

// gif class construction
Animatedgif introGif;
Animatedgif pauseGif;
Animatedgif winGif;
Animatedgif loseGif;

// button class construction
Button introButton;
Button dmgButton;
Button spdButton;

// DarknessCell construction
DarknessCell DCell;

// sprite construction
Animatedgif manUp;
Animatedgif manDown;
Animatedgif manLeft;
Animatedgif manRight;

// game engine array list
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;

// color palette
color black = #1C0F00;
color blue = #0B3132;
color brown = #6B4F00;
color beige = #98761D;
color white = #B9A87D;

// fonts
PFont dun;
PFont title;

// keyboard controls
boolean upkey, downkey, leftkey, rightkey, spacekey;
boolean onekey, twokey, threekey, fourkey;
boolean pausekey;

// gameover screens
boolean win;

// Images
PImage map;
PImage bunny;

// room colors
color northRoom, westRoom, southRoom, eastRoom;

// grid coordinates
int x, y;

// generic sizes
int bulletSize = 10;
int enemySize = 50;

// generic lives
int enemyLives = 50;

// generic weapon thresholds
int autoThresh = 12;
int shotThresh = 100;
int sniperThresh = 100;
int sniperBs = 20;

// generic weapon bullet speeds
int autoBs = 5;
int shotBs = 5;

// button roundness
int buttonRoundnessintro = 30;

// text size in button
int textSizeintro = 50;

// gif position
int gifXintro = 0;
int gifYintro = 0;

// gif frames
int numFramesintro = 3;

// gif size
int gifWidthintro;
int gifHeightintro;
int buttonIntrowidth = 200;
int buttonIntroheight = 100;

// xp
int xp;

// hero speed
int speed2;
int speed;
int maxSpeed;

// bullet damage
int dmgUpgrade;
int maxDmg;

void setup () {
  size(800, 800);

  // initialize xp
  xp = 0;

  // initialize bullet damage
  dmgUpgrade = 0;
  maxDmg = 5;

  // initialize hero speed
  speed2 = 0;
  speed = 5;
  maxSpeed = 10;

  // initialize sound variables
  minim = new Minim(this);
  game = minim.loadFile("danger.mp3");

  // initialize pausekey
  pausekey = false;

  // initialize gif size
  gifWidthintro = width;
  gifHeightintro = height;

  // initialize gameover screen
  win = false;

  // align
  textAlign(CENTER);
  rectMode(CORNER);

  // intro gif
  introGif = new Animatedgif (numFramesintro, 1, "intro_gif/frame_", "_delay-0.1s.gif", gifXintro, gifYintro, gifWidthintro, gifHeightintro);

  // pausegif
  pauseGif = new Animatedgif (3, 1, "pause_gif/frame_", "_delay-0.13s.gif", 0, 0, width, height);

  // gameover gif
  winGif = new Animatedgif (8, 1, "win_gif/frame_", "_delay-0.08s.gif", 0, 0, width, height);
  loseGif = new Animatedgif (37, 1, "lose_gif/frame_", "_delay-0.07s.gif", 0, 0, width, height);

  // hero gifs
  manUp = new Animatedgif (4, 10, "man/up/sprite_", ".png");
  manDown = new Animatedgif (4, 10, "man/down/sprite_", ".png");
  manLeft = new Animatedgif (4, 10, "man/left/sprite_", ".png");
  manRight = new Animatedgif (4, 10, "man/right/sprite_", ".png");

  // start button
  introButton = new Button (width/2 - 100, height/2 + 100, buttonIntrowidth, buttonIntroheight, "PLAY", black, brown, textSizeintro, buttonRoundnessintro);

  // upgrade buttons
  dmgButton = new Button (width/2 + 100, height/2 + 200, 70, 70, "+", black, white, 50, 30);
  spdButton = new Button (width/2 + 100, height/2 + 100, 70, 70, "+", black, white, 50, 30);

  // hero
  myHero = new Hero();

  // DarknessCell
  DCell = new DarknessCell(0, 0, width*2);

  // game engine
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myHero);

  // mode initialization
  mode = INTRO;

  // fonts
  dun = loadFont("CooperBlackMS-48.vlw");
  title = loadFont("MaturaMTScriptCapitals-48.vlw");

  // map
  map = loadImage("map.png");

  // bunny
  bunny = loadImage("speed.jpg");

  // initialize grid
  x = 0;
  y = 0;

  // create darkness
  darkness = new ArrayList<DarknessCell>(1000);
  while (y < 800) {
    darkness.add(new DarknessCell(x, y, 5));
    x = x + 5;
    if (x == 800) {
      y = y + 5;
      x = 0;
    }
  }

  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == blue) {
      myObjects.add(new turret(x, y));
    } else if (roomColor == white) {
      myObjects.add(new follower(x, y));
    } else if (roomColor == beige) {
      myObjects.add(new Boss(x, y));
    } else {
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw () {
  // mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  }

  // button function
  click();
}
