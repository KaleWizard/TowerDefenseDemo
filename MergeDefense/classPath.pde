
class Path {
  PathSegment[] segments;
  int len;
  float pathStartX;
  
  Path(PathSegment[] s, int l) {
    segments = s;
    len = l;
    pathStartX = segments[0].endpoint.x;
  }
  
  void render() {
    noStroke();
    fill(#1D2B53);
    rectMode(CORNERS);
    for (int i = 0; i < len; i++) {
      segments[i].render(i % 2 == 0);
    }
    rectMode(CORNER);
    for (int i = 0; i < 4; i++) {
      renderIndicator(pathStartX, 25 - 37.5 * i, pow(0.5, i));
    }
  }
  
  void renderIndicator(float x, float y, float opacity) {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(#FFEC27, opacity);
    beginShape();
    vertex(0, 0);
    vertex(-25, -25);
    vertex(-25, -50);
    vertex(0, -25);
    vertex(25, -50);
    vertex(25, 25);
    endShape(CLOSE);
    popMatrix();
  }
  
  PVector getEndpoint(int index) {
    if (index < 0 || index >= len) {
      return null;
    } else {
      return segments[index].endpoint;
    }
  }
}
