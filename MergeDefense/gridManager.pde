
int gridWidth = 12;
int gridHeight = 9;
boolean[][] pathGrid;
TurretActive[][] turretGrid;

void initializeGrid(Path p) {
  pathGrid = new boolean[gridWidth][gridHeight];
  for (int i = 0; i < p.len; i++) {
    PathSegment s = p.segments[i];
    if (i % 2 == 0) {
      for (int j = max(0, s.y); j < s.y + s.len; j++) {
        pathGrid[s.x][j] = true;
      }
    } else {
      for (int j = s.x; j < s.x + s.len; j++) {
        pathGrid[j][s.y] = true;
      }
    }
  }

  turretGrid = new TurretActive[gridWidth][gridHeight];
}

boolean isPath(int x, int y) {
  return pathGrid[x][y];
}

void addTurret(TurretActive t, int x, int y) {
  if (turretGrid[x][y] == null) {
  turretGrid[x][y] = t;
  } else {
    turretGrid[x][y].merge(t);
  }
}

void moveTurret(int startX, int startY, int endX, int endY) {
  if (turretGrid[endX][endY] == null) {
    turretGrid[endX][endY] = turretGrid[startX][startY];
  } else {
    turretGrid[endX][endY].merge(turretGrid[startX][startY]);
  }
  turretGrid[startX][startY] = null;
}
