// This file is for on-the-go testing. 
// Expect it to not make the game function properly.

Text words = new Text("$9876543210", 100, 100, 100, color(0));

int counter = 1;

Enemy name;

void initializeTesting() {
  newGame();
}

void testingDraw() {
  gameMain();
  if (isMousePressed && frameCount % 120 == 0) {
    turrets.add(new TurretActive(counter++, 4, 4));
  }
}
