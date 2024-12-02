// The main file of MergeDefense

// If this is true, expect the game not to function properly
boolean isTesting = true;

// Global variables
boolean isPlaying = false;

void setup() {
  size(1600, 900);
  frameRate(30);
  initializeMenu(); // See mainMenu.pde
  initializeGame(); // See gameLogic.pde
  initializeTesting(); // See testingFile.pde
}

void draw() {
  if (isTesting) {
    testingDraw(); // See testingFile.pde
  } else if (isPlaying) {
    gameMain(); // See gameLogic.pde
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
