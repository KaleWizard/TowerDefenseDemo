
// ArrayList<TurretActive> turrets;

//void initializeTurrets() {
//  turrets = new ArrayList<TurretActive>();
//}

class TurretActive extends TurretBase {
  boolean longRange;
  boolean ray;
  boolean explosion;
  int damage;
  int range;
  int framesUntilAttack;
  int attackDelay;
  int explosionRadius;
  int rayWidth;
  boolean isEnabled;
  
  TurretActive(int type, int x, int y) {
    super(type);
    longRange = type == 1;
    ray = type == 2;
    explosion = type == 3;
    if (longRange) {
      damage = LongDamage;
      range = LongRange;
      explosionRadius = LongExplosionRadius;
      rayWidth = LongRayWidth;
      attackDelay = LongDelay;
    } else if (ray) {
      damage = RayDamage;
      range = RayRange;
      explosionRadius = RayExplosionRadius;
      rayWidth = RayRayWidth;
      attackDelay = RayDelay;
    } else if (explosion) {
      damage = ExplosionDamage;
      range = ExplosionRange;
      explosionRadius = ExplosionExplosionRadius;
      rayWidth = ExplosionRayWidth;
      attackDelay = ExplosionDelay;
    } else {
      noLoop();
    }
    framesUntilAttack = int(random(attackDelay));
    position = new PVector(50 + x * 100, 50 + y * 100);
    isEnabled = true;
  }
  
  void render() {
    if (isEnabled) super.render();
  }
  
  void attack(ArrayList<Enemy> enemies) {
    if (framesUntilAttack > 0 || !isEnabled) {
      framesUntilAttack--;
      return;
    }
    Enemy target = null;
    for (Enemy e: enemies) {
      if (inRange(e)) {
        target = e;
        break;
      }
    }
    if (target == null) return;
    if (longRange) {
      if (ray && !explosion) {
        targetedRay(target); // longRange+ray
      } else {
        bullet(); // longRange, longRange+explosion, longRange+ray+explosion
      }
    } else {
      if (ray) {
        fourRays(position, rayWidth + explosionRadius, damage); // ray, ray+explosion
      } else {
        explosion(); // explosion
      }
    }
    framesUntilAttack = attackDelay;
  }
  
  boolean inRange(Enemy e) {
    return dist(e.position.x, e.position.y, position.x, position.y) <= range;
  }
  
  //Bullet(PVector originPosition, int dmg, int round, int explosionR, int rayW)
  void targetedRay(Enemy e) {
    PVector direction = e.position.copy().sub(position);
    rays.add(new Ray(position, direction, rayWidth, damage));
  }
  
  void bullet() {
    bullets.add(new Bullet(position, damage, roundNumber, explosionRadius, rayWidth));
  }
  
  void explosion() {
    explosions.add(new Explosion(position, damage, explosionRadius));
  }
  
  void merge(TurretActive merging) {
    sides += merging.sides;
    red = max(red, merging.red);
    green = max(green, merging.green);
    blue = max(blue, merging.blue);
    damage = mergeValues(damage, merging.damage);
    range = mergeValues(range, merging.range);
    rayWidth = mergeValues(rayWidth, merging.rayWidth);
    explosionRadius = mergeValues(explosionRadius, merging.explosionRadius);
    if (attackDelay == merging.attackDelay) {
      attackDelay = int(attackDelay * 0.9);
    } else {
    attackDelay = min(attackDelay, merging.attackDelay);
    }
    longRange = longRange || merging.longRange;
    ray = ray || merging.ray;
    explosion = explosion || merging.explosion;
  }
  
  int mergeValues(int a, int b) {
    return max(a, b) + min(a, b) / 2;
  }
  
  void deactivate() {
    isEnabled = true;
  }
  
  void activate() {
    isEnabled = true;
  }
}
