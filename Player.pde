

enum Position {
  top, bottom;
};


class Player {
  final float maxX = 700;
  float x = 0;
  float y = 0;
  float width = 100;
  float height = 15;
  int padlespeed = 8;
  int score = 0;
  private Position position;
  private char left;
  private char right;

  Player(Position position, int w, int h) {
    this.position = position;
    this.x = w/2;
    switch(position) {
    case top:
      this.y = this.height;
      this.left = 'j';
      this.right = 'l';
      break;
    case bottom:
      this.y = h - this.height * 2;
      this.left = 'a';
      this.right = 'd';
      break;
    }
  }

  void draw() {
    rect(x, y, width, height);
  }

  float maxXpos(float by) {
    this.x += by;
    if (this.x < 0) {
      this.x = 0;
    }
    if (this.x > this.maxX) {
      this.x = this.maxX;
    }
    return this.x;
  }

  void move() {
    if (keysIn.contains(this.left)) {
      x = x - padlespeed;
    }
    if (keysIn.contains(this.right)) {
      x = x + padlespeed;
    }
  }

  boolean hasCollided(Ball ball) {
    boolean result = false;
    switch(position) {
    case top:
      if (ball.y <= (this.y + 3*this.height/2)) {
        result = true;
      }
      break;
    case bottom:
      if (ball.y >= this.y - ball.size/2) {
        result = true;
      }
      break;
    }

    if (result) {
      if (ball.x >= this.x && ball.x <= (this.x + this.width)) {
        return true;
      }
    }

    return false;
  }

  void run() {
    draw();
    move();
  }
}