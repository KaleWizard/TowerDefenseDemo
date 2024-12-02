
class PathSegment {
  int x;
  int y;
  int len;
  PVector endpoint;
  
  PathSegment(int xPos, int yPos, int tLen, boolean isVertical) {
    x = xPos;
    y = yPos;
    len = tLen;
    if (isVertical) {
      endpoint = new PVector(100 * x + 50, 100 * (y + len) + 50);
    } else {
      endpoint = new PVector(100 * (x + len) + 50, 100 * y + 50);
    }
  }
  
  void render(boolean isPathVertical) {
    if (isPathVertical) {
      rect(100 * x + 25, 100 * y + 25, 100 * x + 75, 100 * (y + len) + 75);
    } else {
      rect(100 * x + 25, 100 * y + 25, 100 * (x + len) + 75, 100 * y + 75);
    }
  }
}
