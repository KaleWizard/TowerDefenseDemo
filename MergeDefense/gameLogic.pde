
// Game logic variables
boolean isWaveInProgress;
int nextWave;
int playerMoney;
Health playerHealth;

// Global game objects
Path gamePath;

// UI elements
Text playerMoneyText;
Text startWaveText;
Button startWaveButton;
Text backToMenuText;
Button backToMenuButton;

void initializeGame() {
  playerHealth = new Health(10, loadImage("Heart.png"));
  playerMoneyText = new Text("$", 50, 50, 75, color(255));
  startWaveText = new Text("START WAVE", 1282, 784, 32, color(255));
  startWaveButton = new Button(1250, 750, 300, 100, 20);
  backToMenuText = new Text("MAIN MENU", 640.625, 650, 50, color(255));
  backToMenuButton = new Button(600, 600, 400, 150, 20);
}

void newGame() {
  isWaveInProgress = false;
  nextWave = 1;
  playerMoney = 15;
  playerMoneyText.setString("$" + str(playerMoney));
  playerHealth.reset();
}

void gameMain() {
  if (playerHealth.isPlayerDead()) {
    drawGameState();
    drawUI();
    drawGameOver();
  } else {
    updateGameState();
    drawGameState();
    drawUI();
  }
}

void updateGameState() {
  
}

void drawGameState() {
  background(#3A5953);
  pushMatrix();
  translate(400, 0);
  
  popMatrix();
}

void drawUI() {
  noStroke();
  fill(0);
  rect(0, 0, 400, height);
  playerMoneyText.render();
  playerHealth.render();
  if (!isWaveInProgress) {
    startWaveButton.render();
    startWaveText.render();
    if (startWaveButton.isRollover() && isMousePressed) {
      isWaveInProgress = true;
    }
  }
}

void drawGameOver() {
  noStroke();
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  backToMenuButton.render();
  backToMenuText.render();
}
