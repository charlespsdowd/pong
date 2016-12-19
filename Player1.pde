

class Player1 {
  final float maxX = 700;
  float x = 400;
  int y = 700;
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
    if (keysIn.contains('a')) {
      x = x -padlespeed;
    }
    if (keysIn.contains('d')) {
      x = x +padlespeed;
    }
  }



  void RunPlayer1() {
    draw();
    move();
  }
}