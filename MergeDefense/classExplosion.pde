
ArrayList<Explosion> explosions;

void initializeExplosions() {
  explosions = new ArrayList<Explosion>();
}

class Explosion extends Decayable {
  PVector position;
  float diameter;
  float radius;

  Explosion(PVector pos, int damage, float r) {
    super(damage);
    position = pos.copy();
    radius = r;
    diameter = 2 * radius;
  }

  void doCollision(ArrayList<Enemy> enemies) {
    if (hasDealtDamage) return;
    int i = 0;
    while (i < enemies.size()) {
      Enemy e = enemies.get(i);
      if (collides(e) && e.takeDamage(damage)) {
        enemies.remove(i);
      } else {
        i++;
      }
    }
    hasDealtDamage = true;
  }
  
  boolean collides(Enemy enemy) {
    return dist(position.x, position.y, enemy.position.x, enemy.position.y) < radius + ENEMYRADIUS;
  }
  
  boolean render() {
    noStroke();
    fill(255, 255, 255, opacity);
    ellipse(position.x, position.y, diameter, diameter);
    return decay();
  }
}
