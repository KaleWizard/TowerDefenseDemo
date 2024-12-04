
int gridWidth = 12;
int gridHeight = 9;
boolean[][] pathGrid;
TurretActive[][] turretGrid;

void initializeGrid(Path p) {
  pathGrid = new boolean[gridWidth][gridHeight];
  for (int i = 0; i < p.len; i++) {
    PathSegment s = p.segments[i];
    if (i % 2 == 0) {
      for (int j = max(0, s.y); j <= s.y + s.len && j < gridHeight; j++) {
        pathGrid[s.x][j] = true;
      }
    } else {
      for (int j = s.x; j <= s.x + s.len && j < gridWidth; j++) {
        pathGrid[j][s.y] = true;
      }
    }
  }

  turretGrid = new TurretActive[gridWidth][gridHeight];
}

boolean isPath(int x, int y) {
  return pathGrid[x][y];
}

void drawTileIndicator() {
  int x = mouseX - 400 - mouseX % 100;
  x = constrain(x, -1, width - 401);
  int y = mouseY - mouseY % 100;
  y = constrain(y, 0, height - 1);
  if (x < 0) return;
  int gridX = x / 100;
  
  int gridY = y / 100;
  noStroke();
  if (pathGrid[gridX][gridY]) {
    fill(#E53149);
  } else if ((!heldTurret.show && turretGrid[gridX][gridY] != null)
  || (heldTurret.show)) {
    fill(#64CFFF);
  } else {
    return;
  }
  rect(x, y, 100, 100);
}

void addTurret(TurretActive t, int x, int y) {
  if (turretGrid[x][y] == null) {
  turretGrid[x][y] = t;
  } else {
    turretGrid[x][y].merge(t);
  }
}

void moveTurret(int startX, int startY, int endX, int endY) {
  TurretActive moving = turretGrid[startX][startY];
  turretGrid[startX][startY] = null;
  if (turretGrid[endX][endY] == null) {
    moving.position.set(50 + 100 * endX, 50 + 100 * endY);
    turretGrid[endX][endY] = moving;
  } else {
    turretGrid[endX][endY].merge(moving);
  }
}
