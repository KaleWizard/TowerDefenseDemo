
class Health {
  int value;
  int maxHealth;
  PImage heart;
  Text text;
  
  Health(int tempMaxHealth, PImage tempHeart) {
    value = maxHealth = tempMaxHealth;
    heart = tempHeart;
    text = new Text("", 1350, 50, 100, color(0));
    updateText();
  }
  
  void render() {
    image(heart, 1225, 50);
    text.render();
  }
  
  boolean isPlayerDead() {
    return value <= 0;
  }
  
  void reset() {
    value = maxHealth;
    updateText();
  }
  
  void takeDamage(int damage) {
    value -= damage;
    updateText();
  }
  
  void updateText() {
    text.setString(str(value));
  }
}
