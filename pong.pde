ArrayList<Character> keysIn;
Player1 myPlayer1;
Player2 myPlayer2;
Ball myBall;

void draw() {
  background(127);
  myPlayer1.RunPlayer1();
  myBall.RunBall();
  myPlayer2.RunPlayer2();
}


void setup() {
  size(800, 800);
  myPlayer1 = new Player1();
  keysIn = new ArrayList<Character>();
  myBall = new Ball();
  myPlayer2 = new Player2();
}

void keyTyped() {
  if (!keysIn.contains(key)) {
    keysIn.add(key);
  }
}


void keyReleased() {
  if (keysIn.contains(key)) {
    keysIn.remove(new Character(key));
  }
}