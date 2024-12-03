
// Game logic variables
boolean isWaveInProgress;
Wave currentWave;
int playerMoney;
Health playerHealth;

// Global game objects
Path gamePath;
ArrayList<Enemy> enemies;
int roundNumber;

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
  backToMenuText = new Text("MAIN MENU", 640.625, 450, 50, color(255));
  backToMenuButton = new Button(600, 400, 400, 150, 20);
}

void newGame() {
  gamePath = getPath(); // See pathSelection.pde
  enemies = new ArrayList<Enemy>();
  roundNumber = 1;
  currentWave = new Wave(roundNumber);
  isWaveInProgress = false;
  playerMoney = 15;
  playerMoneyText.setString("$" + str(playerMoney));
  playerHealth.reset();
  initializeExplosions(); // See classExplosion.pde
  initializeRays(); // See classRays.pde
  initializeBullets(); // See classBullets.pde
  initializeTurrets(); // See classTurretActive.pde
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
  if (isWaveInProgress) {
    currentWave.spawnEnemy(enemies, gamePath);
  }
  int i = 0;
  while (i < enemies.size()) {
    Enemy e = enemies.get(i);
    if (e.update()) {
      enemies.remove(i);
    } else {
      i++;
    }
  }
  if (currentWave.isDone() && enemies.isEmpty()) {
    isWaveInProgress = false;
  }
  for (TurretActive t : turrets) {
    t.attack(enemies);
  }
  if (!enemies.isEmpty()) {
    PVector target = enemies.get(0).position;
    for (Bullet b : bullets) {
      b.update(target);
    }
  }
  i = 0;
  while (i < bullets.size()) {
    Bullet b = bullets.get(i);
    if (b.doCollision(enemies)) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  i = 0;
  while (i < rays.size()) {
    rays.get(i++).doCollision(enemies);
  }
  i = 0;
  while (i < explosions.size()) {
    explosions.get(i++).doCollision(enemies);
  }
}

void drawGameState() {
  background(#3A5953);
  pushMatrix();
  translate(400, 0);
  gamePath.render();
  int i = 0;
  while (i < explosions.size()) {
    Explosion e = explosions.get(i);
    if (e.render()) {
      explosions.remove(i);
    } else {
      i++;
    }
  }
  i = 0;
  while (i < rays.size()) {
    Ray r = rays.get(i);
    if (r.render()) {
      rays.remove(i);
    } else {
      i++;
    }
  }
  for (Enemy e : enemies) {
    e.render();
  }
  for (Bullet b : bullets) {
    b.render();
  }
  for (TurretActive t : turrets) {
    t.render();
  }
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
      enemies = new ArrayList<Enemy>();
      roundNumber++;
      currentWave = new Wave(roundNumber);
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
  if (backToMenuButton.isRollover() && isMousePressed) {
    isPlaying = false;
  }
}
