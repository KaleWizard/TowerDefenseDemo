
class Decayable {
  float opacity;
  int damage;
  boolean hasDealtDamage;
  
  Decayable(int dmg) {
    opacity = 255;
    damage = dmg;
  }
  
  boolean decay() {
    opacity *= 0.5;
    return isTooTransparent();
  }
  
  boolean isTooTransparent() {
    return opacity < 10;
  }
}
