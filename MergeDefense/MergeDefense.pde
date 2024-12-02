// The main file of MergeDefense

// If this is true, expect the game not to function properly
boolean isTesting = true;

// Main variables
boolean isPLaying = false;

void setup() {
  size(1600, 900);
}

void draw() {
  if (isTesting) {
    testingDraw(); // See testingFile.pde
  } else {
    gameMain();
  }
}

void gameMain() {
  
}



// I really don't like not knowing exactly when these functions get called
//  so I'm just going to check if the mouse has been pressed but not released
// and use a boolean to check when I want to check
boolean isMousePressed = false;

void mousePressed() {
  isMousePressed = true;
}

void mouseReleased() {
  isMousePressed = false
}
