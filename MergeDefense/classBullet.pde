
ArrayList<Bullet> bullets;

void initializeBullets() {
  bullets = new ArrayList<Bullet>();
}

class Bullet {
  PVector position;
  PVector velocity;
  PVector origin;
  int damage;
  int explosionRadius;
  int rayWidth;
  color c;

  Bullet(PVector originPosition, int dmg, int round, int explosionR, int rayW) {
    origin = originPosition;
    position = origin.copy();
    velocity = new PVector(0, 0);
    damage = dmg;
    explosionRadius = explosionR;
    rayWidth = rayW;
    int GBValue = (damage * 20) / round;
    c = color(255, GBValue, GBValue);
  }

  void update(PVector enemyPosition) {
    if (enemyPosition != null) {
      PVector acceleration = enemyPosition.copy().sub(position).setMag(2);
      velocity.add(acceleration).limit(15);
    }
    position.add(velocity);
  }

  void render() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, 10, 10);
  }

  boolean doCollision(ArrayList<Enemy> enemies) {
    int i = 0;
    while (i < enemies.size()) {
      Enemy e = enemies.get(i);
      if (collides(e)) {
        if (e.takeDamage(hit())) {
          killEnemy(i);
        }
        return true;
      } else {
        i++;
      }
    }
    return false;
  }

  boolean collides(Enemy e) {
    return dist(e.position.x, e.position.y, position.x, position.y) <= ENEMYRADIUS + 5;
  }

  int hit() {
    if (explosionRadius == 0) return damage;
    explosions.add(new Explosion(position, damage, explosionRadius));
    if (rayWidth == 0) return 0;
    fourRays(position, rayWidth, damage);
    return 0;
  }
}
