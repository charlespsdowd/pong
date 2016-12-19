

class Ball {
  float x = 400;
  float y = 400;
  int xspeed = 5;
  int yspeed = 3;
  int size = 20;
  float timer;
  float time = timer;
  float speedincrease = time;

  void draw() {
    ellipse(x, y, size, size);
  }

  void timer() {
    timer = millis()/100;
  }

  void bounce() {
    if (x > 800) {
      xspeed = xspeed * -1;
    }

    if (x < 0) {
      xspeed = xspeed * -1;
    }
  }

  void move() {
    x = x + xspeed + speedincrease;
    y = y + yspeed + speedincrease;
    print(",", speedincrease);
  }

  boolean hasCollieed(Ball withBall) {
    return false;
  }

  void RunBall() {
    draw();
    bounce();
    move();
    timer();
  }
}