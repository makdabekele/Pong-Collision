public class Ball {
  float x;
  float y;
  float vx, vy;
  float r = 10;
  float speed = 12;

  Ball(float posX, float posY) {
    x = posX;
    y = posY;
    direction();
  }
  void direction() {
    float randX = random(1);
      if (randX < 0.5) {
        vx = 4;
      }
       else {
        vx = -4;
       }
  float randY = random(1);
  if (randY < 0.5) {
    vy = 3;
  } else {
    vy = -3;
  }
}

  void reset() {
    x = width/2;
    y = height/2;
    direction();
  }

  void move() {
    x += vx;
    y += vy;

  }

  void checkWallsAndScore() {
    if (y - r <= 0) {
      y = r;
      vy *= -1;
    } 
    else if (y + r >= height) {
      y = height - r;
      vy *= -1;
    }

    if (x + r < 0) {
      rightScore++;
      reset();
    } 
    else if (x - r > width) {
      leftScore++;
      reset();
    }
  }

  void collide(Paddle p) {
    float nearestX = constrain(x, p.x, p.x + p.w);
    float nearestY = constrain(y, p.y, p.y + p.h);
    float dx = x - nearestX;
    float dy = y - nearestY;
    if (dx*dx + dy*dy <= r*r) {
      if (p.isRight) {
        x = p.x - r; 
        vx = -abs(vx);
      } else {
        x = p.x + p.w + r; 
        vx = abs(vx);
      }

      vy += p.vy * 0.5;

    //speedsit up?
    //omg yaaaaa
    float speed = sqrt(vx*vx + vy*vy);
    float newSpeed = min(speed + 0.6, speed);

    float normX = vx / speed;
    float normY = vy / speed;

    vx = normX * newSpeed;
    vy = normY * newSpeed;
    }
  }
  void display() {
    noStroke();
    fill(random(255), random(255), random(255));
    ellipse(x, y, (r*2), (r*2));
  }
}
