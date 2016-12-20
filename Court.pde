

class Court {
  int x, y;

  int width;
  int height;

  int netline;
  int serviceBox;

  int scoreBoard;

  Court(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.layoutCourt();
  }

  void layoutCourt() {
    this.netline = this.height / 2;
    this.serviceBox = this.netline / 2;
  }
}