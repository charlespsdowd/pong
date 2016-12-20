
Application app;
ArrayList<Character> keysIn;
Player myPlayer1;
Player myPlayer2;
Ball myBall;
Court myCourt;

enum TennisScore {
  love, fifteen, thirty, forty, duce, advantage, unadvantage, game
};


class Application {
  int w = 800;
  int h = 600;
  int score1;
  int score2;
  TennisScore[] scores =  { TennisScore.love, TennisScore.love };

  Application(int w, int h) {
    this.w = w;
    this.h = h;
  }

  void newGame() {
    this.score1 = 0;
    this.score2 = 0;
  }

  int wonPoint(int playerWon, int playerLost) {
    switch(scores[playerWon]) {
    case love: 
      this.scores[playerWon] = TennisScore.fifteen;
      break;
    case fifteen: 
      this.scores[playerWon] = TennisScore.thirty;
      break;
    case thirty: 
      switch(this.scores[playerLost]) {
      case forty:
        this.scores[playerWon] = TennisScore.duce;
        this.scores[playerLost] = TennisScore.duce;
        break;
      default:
        this.scores[playerWon] = TennisScore.forty;
        break;
      }        
      break;
    case forty:
    case advantage:
      this.scores[playerWon] = TennisScore.game;
      break;
    case duce:
      this.scores[playerWon] = TennisScore.advantage;
      this.scores[playerLost] = TennisScore.unadvantage;
      break;
    case unadvantage:
      this.scores[playerWon] = TennisScore.duce;
      this.scores[playerLost] = TennisScore.duce;
      break;
    default:
      break;
    }

    print("Score: ", this.scores[0], " : ", this.scores[1]);

    return 0;
  }
}

void draw() {
  background(127);
  myPlayer1.run();
  myBall.run();
  myPlayer2.run();

  if (!myBall.hasCollided(myPlayer1)) {
    if (!myBall.hasCollided(myPlayer2)) {
      if(myBall.checkScored()) {
        myBall = new Ball();
      }
    }
  }
}


void setup() {
  app = new Application(800, 600);
  size(800, 600);
  myPlayer1 = new Player(Position.bottom, app.w, app.h);
  myPlayer2 = new Player(Position.top, app.w, app.h);
  keysIn = new ArrayList<Character>();
  myBall = new Ball();
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