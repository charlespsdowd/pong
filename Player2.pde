

class Player2 {
  final float maxX = 700;
  float x = 400;
  int y = 50;
  int width = 100;
  int height = 15;
  int padlespeed = 8;

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
    if (keysIn.contains('j')) {
      x = x -padlespeed;
    }
    if (keysIn.contains('l')) {
      x = x +padlespeed;
    }
  }



  void RunPlayer2() {
    draw();
    move();
  }
}