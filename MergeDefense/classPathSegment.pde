
class PathSegment {
  int x;
  int y;
  int len;
  PVector endpoint;
  
  PathSegment(int xPos, int yPos, int tLen, PVector end) {
    x = xPos;
    y = yPos;
    len = tLen;
    endpoint = end;
  }
  
  void render(boolean isPathVertical) {
    if (isPathVertical) {
      rect(100 * x - 75, 100 * y - 75, 100 * x - 25, 100 * (y + len) - 25);
    } else {
      rect(100 * x - 75, 100 * y - 75, 100 * (x + len) - 25, 100 * y - 25);
    }
  }
}
