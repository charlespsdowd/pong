

class Ball {
  float x = app.w/2;
  float y = app.h/2;
  int xspeed = 3;
  int yspeed = 1;
  int size = 20;
  float timer;
  float time = timer;
  float speedincrease = 0;
  boolean bounceYWallTop = true;
  boolean bounceYWallBottem = true;

  void draw() {
    ellipse(x, y, size, size);
  }

  void timer() {
    timer = millis()/100;
  }

  void bounceXWall() {
    if (x >= app.w) {
      xspeed = -xspeed;
    }

    if (x <= 0) {
      xspeed = -xspeed;
    }
  }

  void bounceYWall() {
    return;


    //if (y >= app.h) {
    //  yspeed = -yspeed;
    //}
    //if (y <= 0) {
    //  yspeed = -yspeed;
    //}
  }

  void paddleBounce() {
    this.paddleBounceX();
    this.paddleBounceY();
  }

  void paddleBounceX() {
    xspeed = -xspeed;
  }

  void paddleBounceY() {
    yspeed = -yspeed;
  }

  void move() {
    x = x + xspeed + speedincrease;
    y = y + yspeed + speedincrease/2;
    //print(",", speedincrease);
  }

  boolean hasCollided(Player withPlayer) {
    if (withPlayer.hasCollided(this)) {
      this.paddleBounceY();
      return true;
    }
    return false;
  }

  boolean checkScored() {
    if (y > app.h) {
      app.wonPoint(1, 0);
      return true;
    } else if (y < 0) {
      app.wonPoint(0, 1);
      return true;
    }
    return false;
  }

  void run() {
    draw();
    bounceXWall();
    bounceYWall();
    move();
    timer();
  }
}