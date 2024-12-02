
Text title;
Button playButton;
Text play;

void initializeMenu() {
  title = new Text("MERGE DEFENSE", 78.125, 250, 150, color(255));
  playButton = new Button(600, 600, 400, 150, 20);
  play = new Text("PLAY", 656.25, 625, 100, color(255));
}


void mainMenu() {
  background(0);
  title.render();
  playButton.render();
  play.render();
  if (playButton.isRollover() && isMousePressed) {
    newGame(); // See gameLogic.pde
    isPlaying = true;
  }
}
