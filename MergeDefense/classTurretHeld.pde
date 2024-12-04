
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
    if (mouseX < 50 || mouseX > 200) return;
    if (200 < mouseY && mouseY < 350 && playerMoney >= typeOneCost) {
      originType = 1;
      playerMoney -= typeOneCost;
      displacement = new PVector(125 - mouseX, 275 - mouseY);
      show = true;
    } else if (450 < mouseY && mouseY < 600 && playerMoney >= typeTwoCost) {
      originType = 2;
      playerMoney -= typeTwoCost;
      displacement = new PVector(125 - mouseX, 525 - mouseY);
      show = true;
    } else if (700 < mouseY && mouseY < 850 && playerMoney >= typeThreeCost) {
      originType = 3;
      playerMoney -= typeThreeCost;
      displacement = new PVector(125 - mouseX, 775 - mouseY);
      show = true;
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
    int x = (mouseX - 400) / 100;
    int y = mouseY / 100;
    TurretActive t = turretGrid[x][y];
    if (t == null) return;
    t.deactivate();
    show = true;
    isOriginGrid = true;
    originX = x;
    originY = y;
    displacement.set((450 + 100 * x) - mouseX, (50 + 100 * y) - mouseY);
    red = t.red;
    green = t.green;
    blue = t.blue;
    sides = t.sides;
  }

  void dropPoly() {
    show = false;
    if (isOriginGrid) {
      dropGridPoly();
    } else {
      dropSidebarPoly();
    }
  }

  void dropGridPoly() {
    int x = (mouseX + int(displacement.x) - 400) / 100;
    x = constrain(x, 0, gridWidth - 1);
    int y = (mouseY + int(displacement.y)) / 100;
    y = constrain(y, 0, gridHeight - 1);
    if (mouseX < 400 || pathGrid[x][y]) {
      turretGrid[originX][originY].activate();
    } else {
      moveTurret(originX, originY, x, y);
    }
  }

  void dropSidebarPoly() {
    int x = (mouseX + int(displacement.x) - 400) / 100;
    x = constrain(x, 0, gridWidth - 1);
    int y = (mouseY + int(displacement.y)) / 100;
    y = constrain(y, 0, gridHeight - 1);
    if (mouseX < 400 || pathGrid[x][y]) {
      if (originType == 1) {
        playerMoney += typeOneCost;
      } else if (originType == 2) {
        playerMoney += typeTwoCost;
      } else if (originType == 3) {
        playerMoney += typeThreeCost;
      }
    } else {
      addTurret(new TurretActive(originType, x, y), x, y);
    }
  }
}
