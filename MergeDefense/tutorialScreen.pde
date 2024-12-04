
Text startGameText;
Button startGameButton;

void initializeTutorial() {
  startGameText = new Text("START GAME", 1282, 784, 32, color(255));
  startGameButton = new Button(1250, 750, 300, 100, 20);
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
}
