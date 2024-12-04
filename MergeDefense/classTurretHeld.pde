
class TurretHeld extends TurretBase {
  boolean show;
  PVector displacement;
  boolean isOriginGrid;
  int originX;
  int originY;
  int originType;

  TurretHeld() {
    super(1);
    displacement = new PVector(0, 0);
    position = new PVector(0, 0);
    show = false;
  }

  void render() {
    if (!show) return;
    position.set(mouseX + displacement.x, mouseY + displacement.y);
    super.render();
  }

  void update() {
    if (isMousePressed) {
      if (!show) getPoly();
      position.set(mouseX + displacement.x, mouseY + displacement.y);
    } else {
      if (show) dropPoly();
    }
  }

  void getPoly() {
    if (mouseX < 400) {
      getSidebarPoly();
    } else {
      getGridPoly();
    }
  }

  void getSidebarPoly() {
    if (50 < mouseX && mouseX < 200) {
      if (200 < mouseY && mouseY < 350) {
        originType = 1;
        playerMoney -= typeOneCost;
        displacement = new PVector(mouseX - 125, mouseY - 275);
        show = true;
      } else if (450 < mouseY && mouseY < 600) {
        originType = 2;
        playerMoney -= typeTwoCost;
        displacement = new PVector(mouseX - 125, mouseY - 525);
        show = true;
      } else if (700 < mouseY && mouseY < 850) {
        originType = 3;
        playerMoney -= typeThreeCost;
        displacement = new PVector(mouseX - 125, mouseY - 775);
        show = true;
      }
    }
    if (show) {
      isOriginGrid = false;
      red = originType == 1? 255: 0;
      green = originType == 2? 255: 0;
      blue = originType == 3? 255: 0;
      if (red + green + blue == 0) noLoop();
      sides = 2 + originType;
    }
  }

  void getGridPoly() {
  }

  void dropPoly() {
  }
}
