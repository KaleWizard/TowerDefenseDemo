
int ENEMYRADIUS = 45;
int ENEMYDIAMETER = 2 * ENEMYRADIUS;

class Enemy {
  PVector position;
  PVector velocity;
  PVector target;
  int targetIndex;
  int health;
  int maxHealth;
  
  Enemy(int tempMaxHealth, Path p) {
    targetIndex = 0;
    target = p.getEndpoint(0);
    position = new PVector(p.pathStartX, -50);
    setVelocity();
    health = maxHealth = tempMaxHealth;
  }
  
  void render() {
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    fill(#8A275C);
    ellipse(0, 0, 90, 90);
    fill(#C53783);
    arc(0, 0, 90, 90, TAU * (0.75 - (float(health) / maxHealth)), TAU * 0.75, PIE);
    fill(#8A275C);
    ellipse(0, 0, 60, 60);
    popMatrix();
  }
  
  boolean update() {
    position.add(velocity);
    if (dist(position.x, position.y, target.x, target.y) <= 3) {
      targetIndex++;
      target = gamePath.getEndpoint(targetIndex);
      if (target == null) {
        playerHealth.takeDamage(1);
        return true;
      }
      setVelocity();
    }
    return false;
  }
  
  void setVelocity() {
    velocity = target.copy().sub(position).normalize().mult(4);
  }
  
  boolean takeDamage(int damage) {
    health -= damage;
    return health <= 0;
  }
}
