// The main file of MergeDefense

// If this is true, expect the game not to function properly
boolean isTesting = false;

// Global variables
boolean isPlaying = false;
boolean isViewingTutorial = false;

void setup() {
  size(1600, 900);
  frameRate(60);
  initializePaths(); // See pathSelection.pde
  initializeMenu(); // See mainMenu.pde
  initializeGame(); // See gameLogic.pde
  initializeTutorial(); // See tutorialScreen.pde
  initializeTesting(); // See testingFile.pde
}

void draw() {
  if (isTesting) {
    testingDraw(); // See testingFile.pde
  } else if (isPlaying) {
    gameMain(); // See gameLogic.pde
  } else if (isViewingTutorial) {
    tutorialScreen(); // See tutorialScreen.pde
  } else {
    mainMenu(); // See mainMenu.pde
  }
}

// I really don't like not knowing exactly when these functions get called
//  so I'm just going to check if the mouse has been pressed but not released
// and use a boolean to check when I want to check
boolean isMousePressed = false;

void mousePressed() {
  isMousePressed = true;
}

void mouseReleased() {
  isMousePressed = false;
}
