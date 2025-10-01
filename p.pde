public class Paddle {
  float x, y;
  float w = 10;
  float h = 100;
  boolean isRight;
  float vy = 0;      
  float speed = 7;

  Paddle(float px, float py, boolean rightSide) {
    x = px;
    y = py;
    isRight = rightSide;
  }

  void move(boolean upPressed, boolean downPressed) {
    vy = 0;
    if (upPressed)   vy -= speed;
    if (downPressed) vy += speed;

    y += vy;
    y = constrain(y, 0, height - h);
  }

  void display() {
    fill(0);
    rect(x, y, w, h);
  }
}
