

class TurretBase {
  int red;
  int green;
  int blue;
  int sides;
  PVector position;
  
  TurretBase(int type) {
    red = type == 1? 255: 0;
    green = type == 2? 255: 0;
    blue = type == 3? 255: 0;
    if (red + green + blue == 0) noLoop();
    sides = 2 + type;
  }
  
  void render() {
    noStroke();
    fill(red, green, blue);
    beginShape();
    for (int i = 0; i < sides; i++) {
      float angle = TAU * i / sides;
      vertex(position.x +  45 * sin(angle), position.y + 45 * cos(angle));
    }
    endShape(CLOSE);
  }
}
