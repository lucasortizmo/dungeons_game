void intro () {

  imageMode(CORNER);
  // intro gif
  introGif.show();

  // PLAY text
  fill(white);
  textFont(dun);
  textSize(70);
  text("DUNGEON", width/2, height/2 - 200);
  textFont(title);
  text("CRAWL", width/2, height/2 - 50);

  // PLAY button
  introButton.show();

  // mode switch
  if (introButton.clicked) {
    mode = GAME;
    game.loop();
  }
}

void game () {

  imageMode(CENTER);
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMiniMap();

  if (pausekey) mode = PAUSE;
}

void pause () {
  imageMode(CORNER);
  pauseGif.show();
  if (pausekey == false) {
    mode = GAME;
    game.loop();
  }

  textMode(CENTER);
  fill(0);
  textSize(50);
  text("xp : " + xp, width/2, height/2 - 200);

  game.pause();

  textSize(30);
  text("SPEED UPGRADE", width/2 - 100, height/2 + 150);

  text("DAMAGE UPGRADE", width/2 - 100, height/2 + 250);

  dmgButton.show();
  spdButton.show();

  if (dmgButton.clicked) {
    if (xp > 0 && dmgUpgrade < maxDmg) {
      xp--;
      dmgUpgrade++;
    }
  }

  if (spdButton.clicked) {
    if (xp > 0 && speed < maxSpeed) {
      xp--;
      speed++;
    }
  }

  if (speed >= maxSpeed) {
    text("max speed reached", width/2, height/2 - 50);
  }

  if (dmgUpgrade >= maxDmg) {
    text("max damage reached", width/2, height/2 + 50);
  }
}

void gameover() {

  imageMode(CORNER);

  if (win == true) {
    winGif.show();
    fill(255, 0, 0);
    textFont(title);
    textSize(50);
    text("click anywhere to play again", width/2, height/2 - 250);
  } else if (win == false) {
    loseGif.show();
    textFont(title);
    textSize(50);
    text("click anywhere to play again", width/2, height/2 - 250);
  }

  if (mouseReleased) {
    mode = INTRO;
    setup();
  }
}

// GAME FUNCTIONS

void drawRoom () {

  // middle square
  fill(beige);
  square(0, 0, width*2);

  // Draw exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY + 1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);

  // draw doors
  noStroke();
  fill(black);
  if (myHero.roomX < 8 || myHero.roomY < 8) {
    if (northRoom != #FFFFFF) {
      ellipse(width/2, height*0.1 + 20, 100, 100);
    }
    if (eastRoom != #FFFFFF) {
      ellipse(width*0.9 - 20, height/2, 100, 100);
      if (myHero.roomX == 7 && myHero.roomY == 8) {
        fill(255, 0, 0);
        ellipse(width*0.9 - 20, height/2, 100, 100);
      }
    }
    if (southRoom != #FFFFFF) {
      fill(black);
      ellipse(width/2, height*0.9 - 20, 100, 100);
      if (myHero.roomX == 8 && myHero.roomY == 7) {
        fill(255, 0, 0);
        ellipse(width/2, height*0.9 - 20, 100, 100);
      }
    }
    if (westRoom != #FFFFFF) {
      fill(black);
      ellipse(width*0.1 + 20, height/2, 100, 100);
    }
  }

  // lines
  stroke(brown);
  strokeWeight(5);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  // center room
  stroke(brown);
  strokeWeight(5);
  fill(beige);
  square(width*0.1 + 20, height*0.1 + 20, 600);
}

void drawGameObjects () {
  // show game objects
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {
      myObj.show();
      myObj.act();
    }
    if (myObj.lives <= 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void drawMiniMap () {
  int x = 0;
  int y = 0;
  float size = 10;
  while (y < map.height) {
    color c = map.get(x, y);
    fill(c, 100);
    square(x*10 + 50, y*10 + 50, size);
    x = x + 1;
    if (x >= map.width) {
      x = 0;
      y = y + 1;
    }
    fill(255, 0, 0);
    square(myHero.roomX*10 + 50, myHero.roomY*10 + 50, 10);
  }
}

void drawDarkness () {
  // DarknessCell
  int i = 0;
  while (i < darkness.size()) {
    DarknessCell DCell = darkness.get(i);
    DCell.show();
    i++;
  }
}
