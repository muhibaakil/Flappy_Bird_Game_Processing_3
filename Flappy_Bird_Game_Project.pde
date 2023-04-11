int birdX = 100; //horizontal position of bird
float birdY = 300; //vertical position of bird
float birdVelocity = 0; //vertical velocity of bird
int birdSize = 50; //size of bird
color birdColor = #F44336; //color of bird

int pipeX = 700; //horizontal position of pipe
float pipeGap = 200; //gap between pipes
float pipeSpeed = 3; //speed of pipes
int pipeWidth = 80; //width of pipe
float pipeHeight; //height of pipe

int score = 0; //player's score
int highScore = 0; //player's high score

void setup() {
  size(800, 600);
  reset(); //function to reset the game
}

void draw() {
  //display background
  background(0, 191, 255);
  
  //update bird position and velocity
  birdVelocity += 0.5;
  birdY += birdVelocity;
  
  //display the bird
  fill(birdColor);
  ellipse(birdX, birdY, birdSize, birdSize);
  
  //update pipe position
  pipeX -= pipeSpeed;
  
  //if pipe goes off screen, reset pipe position and increase score
  if (pipeX < -pipeWidth) {
    pipeX = width;
    pipeHeight = random(height/2);
    score++;
    //update high score if applicable
    if (score > highScore) {
      highScore = score;
    }
  }
  
  //display pipe
  fill(0, 200, 0);
  rect(pipeX, 0, pipeWidth, pipeHeight);
  rect(pipeX, pipeHeight+pipeGap, pipeWidth, height-(pipeHeight+pipeGap));
  
  //check for collisions
  if (birdY < birdSize/2 || birdY > height-birdSize/2 || (birdX+birdSize/2 > pipeX && birdX-birdSize/2 < pipeX+pipeWidth && (birdY-birdSize/2 < pipeHeight || birdY+birdSize/2 > pipeHeight+pipeGap))) {
    reset(); //function to reset game
  }
  
  //display scores
  textAlign(LEFT);
  textSize(32);
  fill(255);
  text("Score: " + score, 20, 50);
  text("High Score: " + highScore, 20, 100);
}

void mousePressed() {
  //move bird up when mouse is clicked
  birdVelocity = -10;
}

void reset() {
  birdY = height/2;
  birdVelocity = 0;
  pipeX = width;
  score = 0;
}
