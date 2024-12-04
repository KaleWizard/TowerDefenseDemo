
Text startGameText;
Button startGameButton;

TurretBase[] tutorialTurrets = new TurretBase[18];
Text[] tutorialText = new Text[15];

void initializeTutorial() {
  startGameText = new Text("START GAME", 1282, 84, 32, color(255));
  startGameButton = new Button(1250, 50, 300, 100, 20);
  tutorialTurrets[0] = new TurretBase(1);
  tutorialTurrets[0].position = new PVector(200, 300);
  tutorialTurrets[1] = new TurretBase(1);
  tutorialTurrets[1].position = new PVector(400, 300);
  tutorialTurrets[2] = new TurretBase(1);
  tutorialTurrets[2].sides = 6;
  tutorialTurrets[2].position = new PVector(600, 300);
  tutorialTurrets[3] = new TurretBase(2);
  tutorialTurrets[3].position = new PVector(200, 450);
  tutorialTurrets[4] = new TurretBase(2);
  tutorialTurrets[4].position = new PVector(400, 450);
  tutorialTurrets[5] = new TurretBase(2);
  tutorialTurrets[5].sides = 8;
  tutorialTurrets[5].position = new PVector(600, 450);
  tutorialTurrets[6] = new TurretBase(3);
  tutorialTurrets[6].position = new PVector(200, 600);
  tutorialTurrets[7] = new TurretBase(3);
  tutorialTurrets[7].position = new PVector(400, 600);
  tutorialTurrets[8] = new TurretBase(3);
  tutorialTurrets[8].sides = 10;
  tutorialTurrets[8].position = new PVector(600, 600);
  tutorialTurrets[9] = new TurretBase(1);
  tutorialTurrets[9].position = new PVector(1000, 300);
  tutorialTurrets[10] = new TurretBase(2);
  tutorialTurrets[10].position = new PVector(1200, 300);
  tutorialTurrets[11] = new TurretBase(1);
  tutorialTurrets[11].position = new PVector(1000, 450);
  tutorialTurrets[12] = new TurretBase(3);
  tutorialTurrets[12].position = new PVector(1200, 450);
  tutorialTurrets[13] = new TurretBase(2);
  tutorialTurrets[13].position = new PVector(1000, 600);
  tutorialTurrets[14] = new TurretBase(3);
  tutorialTurrets[14].position = new PVector(1200, 600);
  tutorialTurrets[15] = new TurretBase(1);
  tutorialTurrets[15].position = new PVector(450, 800);
  tutorialTurrets[16] = new TurretBase(2);
  tutorialTurrets[16].position = new PVector(650, 800);
  tutorialTurrets[17] = new TurretBase(3);
  tutorialTurrets[17].position = new PVector(850, 800);
  
  float textHeight = 8.0 * 50 / 3;
  tutorialText[0] = new Text("+", 275, 250, textHeight, color(255));
  tutorialText[1] = new Text("=", 475, 250, textHeight, color(255));
  tutorialText[2] = new Text("+", 275, 400, textHeight, color(255));
  tutorialText[3] = new Text("=", 475, 400, textHeight, color(255));
  tutorialText[4] = new Text("+", 275, 550, textHeight, color(255));
  tutorialText[5] = new Text("=", 475, 550, textHeight, color(255));
  tutorialText[6] = new Text("+", 1075, 250, textHeight, color(255));
  tutorialText[7] = new Text("=?", 1275, 250, textHeight, color(255));
  tutorialText[8] = new Text("+", 1075, 400, textHeight, color(255));
  tutorialText[9] = new Text("=?", 1275, 400, textHeight, color(255));
  tutorialText[10] = new Text("+", 1075, 550, textHeight, color(255));
  tutorialText[11] = new Text("=?", 1275, 550, textHeight, color(255));
  tutorialText[12] = new Text("+", 525, 750, textHeight, color(255));
  tutorialText[13] = new Text("+", 725, 750, textHeight, color(255));
  tutorialText[14] = new Text("=???", 925, 750, textHeight, color(255));
}

void tutorialScreen() {
  background(0);
  startGameButton.render();
  startGameText.render();
  if (startGameButton.isRollover() && isMousePressed) {
    newGame(); // See gameLogic.pde
    isPlaying = true;
    isViewingTutorial = false;
  }
  for (TurretBase t: tutorialTurrets) {
    t.render();
  }
  for (Text t: tutorialText) {
    t.render();
  }
}
