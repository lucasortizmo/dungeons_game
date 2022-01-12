class GameObject {

  PVector location;
  PVector velocity;
  int lives;
  int size;
  int roomX, roomY;

  GameObject () {
  }

  void show () {
  }

  void act () {
    location.add(velocity);

    if (lives <= 0) lives = 0;
  }

  boolean inRoomWith(GameObject myObj) {
    if (roomX == myObj.roomX && roomY == myObj.roomY)
      return true;
    else
      return false;
  }

  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    if (inRoomWith(myObj) && d < size/2 + myObj.size/2)
      return true;
    else
      return false;
  }
}
