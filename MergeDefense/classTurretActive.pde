
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
      damage = 2;
      range = 550;
      explosionRadius = 0;
      rayWidth = 0;
      attackDelay = 40;
    } else if (ray) {
      damage = 4;
      range = 400;
      explosionRadius = 0;
      rayWidth = 50;
      attackDelay = 75;
    } else if (explosion) {
      damage = 10;
      range = 200;
      explosionRadius = 125;
      rayWidth = 0;
      attackDelay = 120;
    } else {
      noLoop();
    }
    framesUntilAttack = int(random(attackDelay));
    position = new PVector(50 + x * 100, 50 + y * 100);
  }
  
  void attack(ArrayList<Enemy> enemies) {
    if (framesUntilAttack > 0) {
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
    
  }
  
  boolean inRange(Enemy e) {
    return dist(e.position.x, e.position.y, position.x, position.y) <= range;
  }
  
  void rayBlastBullet() {
    
  }
  
  void targetedRay(Enemy e) {
    
  }
  
  void explodingBullet() {
    
  }
  
  void bullet() {
    
  }
  
  void explosion() {
    
  }
}
