class Hero extends GameObject {

  Weapon myWeapon;
  int currentGun;
  Weapon[] myGuns;

  // immunity variables
  boolean immunity;
  int t;

  // speed instance variables
  int speedTimer;

  Animatedgif currentAction;

  Hero () {
    location = new PVector (width/2 + 50, height/2);
    velocity = new PVector (0, 0);
    size = 30;
    lives = 10;
    roomX = 7;
    roomY = 8;
    myWeapon = new Weapon();

    currentGun = 1;

    myGuns = new Weapon[9];
    myGuns[1] = new Weapon();
    myGuns[2] = new sniperRifle();
    myGuns[3] = new autoPistol();
    myGuns[4] = new shotGun();

    t = 0;

    speedTimer = 1000;

    currentAction = manDown;
  }

  void show () {
    // weapon shooting
    myGuns[currentGun].update();
    if (spacekey) myGuns[currentGun].shoot();
    currentAction.show(location.x, location.y, size/1.5, size);

    float health = map(lives, 0, 10, 0, 29);

    // health bar
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(3);
    rect(location.x - 16, location.y - 25, 30, 5);
    fill(50, 234, 9);
    noStroke();
    rect(location.x - 15, location.y - 24, health, 4);
  }

  void act () {
    super.act();

    speedTimer--;

    if (lives <= 0) {
      win = false;
      mode = GAMEOVER;
      game.pause();
    }

    if (immunity == false) {
      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);
        if ((myObj instanceof follower || myObj instanceof Boss) && isCollidingWith(myObj)) {
          myHero.lives--;
          immunity = true;
        }
        if ((myObj instanceof enemyBullet) && isCollidingWith(myObj)) {
          myObj.lives = 0;
          myHero.lives--;
          immunity = true;
        }
        if (myObj instanceof droppedItem && isCollidingWith(myObj)) {
          droppedItem item = (droppedItem) myObj;
          if (item.type == HEALTH) {
            lives = 10;
            item.lives = 0;
          } else if (item.type == SPEED) {
            speed2 = 5;
            speedTimer = 255;
            item.lives = 0;
          }
        }
        i++;
      }
    }

    if (speedTimer <= 0) {
      speedTimer = 0;
      speed2 = 0;
    }

    if (immunity == true) t++;

    if (t >= 60) {
      t = 0;
      immunity = false;
    }

    if (onekey) currentGun = 1;
    if (twokey) currentGun = 2;
    if (threekey) currentGun = 3;
    if (fourkey) currentGun = 4;

    if (upkey == false) {
      velocity.y = 0;
    }
    if (downkey == false) {
      velocity.y = 0;
    }
    if (leftkey == false) {
      velocity.x = 0;
    }
    if (rightkey == false) {
      velocity.x = 0;
    }

    if (upkey) {
      velocity.y = velocity.y - speed - speed2;
      currentAction = manUp;
    }
    if (downkey) {
      velocity.y = velocity.y + speed + speed2;
      currentAction = manDown;
    }
    if (leftkey) {
      velocity.x = velocity.x - speed - speed2;
      currentAction = manLeft;
    }
    if (rightkey) {
      velocity.x = velocity.x + speed + speed2;
      currentAction = manRight;
    }

    if (rightkey && upkey || rightkey && downkey || leftkey && upkey || leftkey && downkey) velocity.setMag(speed + speed2);

    if (location.x <= 105) location.x = 105;
    if (location.y <= 115) location.y = 115;
    if (location.x >= 695) location.x = 695;
    if (location.y >= 685) location.y = 685;

    // check exits
    if (myHero.roomX < 8 || myHero.roomY < 8) {
      if (northRoom != #FFFFFF && location.y <= height*0.1 + 35 && location.x >= width/2 - 50 && location.x <= width/2 + 50) {
        roomY--;
        location = new PVector(width/2, height*0.9 - 40);
      }
      if (southRoom != #FFFFFF && location.y >= height*0.9 - 35 && location.x >= width/2 - 50 && location.x <= width/2 + 50) {
        roomY++;
        location = new PVector(width/2, height*0.1 + 40);
      }
      if (eastRoom != #FFFFFF && location.x >= width*0.9 - 35 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
        roomX++;
        location = new PVector(width*0.1 + 40, height/2);
      }
      if (westRoom != #FFFFFF && location.x <= width*0.1 + 35 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
        roomX--;
        location = new PVector(width*0.9 - 40, height/2);
      }
    }

    // gameover switch
    if (lives <= 0) {
      mode = GAMEOVER;
    }
  }
}

// keyboard game functions
void keyPressed () {
  if (key == 'w') upkey = true;
  if (key == 's') downkey = true;
  if (key == 'a') leftkey = true;
  if (key == 'd') rightkey = true;
  if (key == ' ') spacekey = true;
  if (key == 'p') pausekey = !pausekey;

  if (key == 'W') upkey = true;
  if (key == 'S') downkey = true;
  if (key == 'A') leftkey = true;
  if (key == 'D') rightkey = true;


  if (keyCode == '1') onekey = true;

  if (keyCode == '2') twokey = true;

  if (keyCode == '3') threekey = true;

  if (keyCode == '4') fourkey = true;
}

void keyReleased () {
  if (key == 'w') upkey = false;
  if (key == 's') downkey = false;
  if (key == 'a') leftkey = false;
  if (key == 'd') rightkey = false;
  if (key == ' ') spacekey = false;

  if (key == 'W') upkey = false;
  if (key == 'S') downkey = false;
  if (key == 'A') leftkey = false;
  if (key == 'D') rightkey = false;

  if (keyCode == '1') onekey = false;

  if (keyCode == '2') twokey = false;

  if (keyCode == '3') threekey = false;

  if (keyCode == '4') fourkey = false;
}
