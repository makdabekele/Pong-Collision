Paddle paddle1;
Paddle paddle2;
Ball ball1;

boolean wDown = false, sDown = false;
boolean upDownKey = false, downDownKey = false;

int leftScore = 0, rightScore = 0;


void setup() {
  size(600, 600);
  paddle1 = new Paddle(70, height/2 - 50, false);
  paddle2 = new Paddle(width - 80, height/2 - 50, true);
  ball1 = new Ball(width/2, height/2);

  textAlign(CENTER, CENTER);
  textSize(24);
}

void draw() {
  background(random(255));

  stroke(220);
  for (int y = 0; y < height; y += 20) {
    line(width/2, y, width/2, y + 10);
  }
  noStroke();

  paddle1.move(wDown, sDown);
  paddle2.move(upDownKey, downDownKey);
  paddle1.display();
  paddle2.display();

  ball1.move();
  ball1.checkWallsAndScore();
  ball1.collide(paddle2);
  ball1.display();
  ball1.collide(paddle1);
  ball1.collide(paddle2);

  fill(0);
  text(leftScore, width/2 - 40, 40);
  text(rightScore, width/2 + 40, 40);
}

void keyPressed() {
  // Letter keys
  if (key == 'w' || key == 'W') wDown = true;
  if (key == 's' || key == 'S') sDown = true;


  if (key == CODED) {
    if (keyCode == UP)   upDownKey = true;
    if (keyCode == DOWN) downDownKey = true;
  }

  if (key == 'r' || key == 'R') ball1.reset();
}

void keyReleased() {
  if (key == 'w' || key == 'W') wDown = false;
  if (key == 's' || key == 'S') sDown = false;

  if (key == CODED) {
    if (keyCode == UP)   upDownKey = false;
    if (keyCode == DOWN) downDownKey = false;
  }
}
