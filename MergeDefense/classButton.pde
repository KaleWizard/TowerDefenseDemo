// Button class from Assignment 3

class Button {
  // Top-left x and y
  float x;
  float y;
  float h; // Height
  float w; // Width
  boolean keyIsPressed;
  boolean mouseIsPressed;
  float pixelSize; // Determines border size

  Button(float tempX, float tempY, float tempW, float tempH, float tempPixelSize) {
    x = tempX;
    y = tempY;
    h = tempH;
    w = tempW;
    keyIsPressed = false;
    mouseIsPressed = false;
    pixelSize = tempPixelSize;
  }

  void render() {
    noStroke();
    fill(175);
    rect(x + pixelSize, y, w - 2 * pixelSize, pixelSize); // Top
    rect(x, y + pixelSize, pixelSize, h - 2 * pixelSize); // Left
    rect(x + pixelSize, y + h - pixelSize, w - 2 * pixelSize, pixelSize); // Bottom
    rect(x + w - pixelSize, y + pixelSize, pixelSize, h - 2 * pixelSize); // Right
    
    if (isPressed()) {
      fill(255, 255, 255, 125); // Lightest when pressed
    } else if (isRollover()) {
      fill(255, 255, 255, 75); // Middle lightness when rollover
    } else {
      fill (255, 255, 255, 40); // Lowest lightness otherwise
    }
    rect(x + pixelSize, y + pixelSize, w - 2 * pixelSize, h - 2 * pixelSize); // "Fill"
  }

  void keyClick() {
    keyIsPressed = true;
  }
  
  void keyUnclick() {
    keyIsPressed = false;
  }

  void mouseClick() {
    if (isRollover()) {
      mouseIsPressed = true;
    }
  }
  
  void mouseUnclick() {
    mouseIsPressed = false;
  }

  boolean isRollover() {
    return x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h;
  }
  
  boolean isPressed() {
    return mouseIsPressed || keyIsPressed;
  }
}
