
ArrayList<Ray> rays;
PVector[] cardinalDirections;

void initializeRays() {
  rays = new ArrayList<Ray>();
  cardinalDirections = new PVector[4];
  cardinalDirections[0] = new PVector(1, 0);
  cardinalDirections[1] = new PVector(-1, 0);
  cardinalDirections[2] = new PVector(0, 1);
  cardinalDirections[3] = new PVector(0, -1);
}

void fourRays(PVector position, float rayWidth, int damage) {
  for (int i = 0; i < 4; i++) {
    rays.add(new Ray(position, cardinalDirections[i], rayWidth, damage));
  }
}


class Ray extends Decayable {
  PVector[] vertices;

  Ray(PVector position, PVector direction, float rayWidth, int damage) {
    super(damage);
    direction = direction.copy().setMag(rayWidth * 0.5);
    PVector widthVector = new PVector(-1 * direction.y, direction.x);
    vertices = new PVector[5];
    vertices[0] = position.copy();
    vertices[1] = position.copy().add(direction).add(widthVector);
    vertices[4] = position.copy().add(direction).sub(widthVector);
    direction.setMag(2000);
    vertices[2] = position.copy().add(direction).add(widthVector);
    vertices[3] = position.copy().add(direction).sub(widthVector);
  }

  void doCollision(ArrayList<Enemy> enemies) {
    if (hasDealtDamage) return;
    int i = 0;
    while (i < enemies.size()) {
      Enemy e = enemies.get(i);
      if (collides(e) && e.takeDamage(damage)) {
        killEnemy(i);
      } else {
        i++;
      }
    }
    hasDealtDamage = true;
  }
  
  boolean render() {
    noStroke();
    fill(255, 255, 255, opacity);
    beginShape();
    vertex(vertices[0].x, vertices[0].y);
    vertex(vertices[1].x, vertices[1].y);
    vertex(vertices[2].x, vertices[2].y);
    vertex(vertices[3].x, vertices[3].y);
    vertex(vertices[4].x, vertices[4].y);
    endShape(CLOSE);
    return decay();
  }

  ////////////////////////////////////////////////////////////////
  //THE FOLLOWING CODE IS SLIGHTLY MODIFIED FROM
  //https://www.jeffreythompson.org/collision-detection/poly-circle.php
  ////////////////////////////////////////////////////////////////

  // POLYGON/CIRCLE
  boolean collides(Enemy enemy) {

    // go through each of the vertices, plus
    // the next vertex in the list
    int next = 0;
    for (int current=0; current<vertices.length; current++) {

      // get next vertex in list
      // if we've hit the end, wrap around to 0
      next = current+1;
      if (next == vertices.length) next = 0;

      // get the PVectors at our current position
      // this makes our if statement a little cleaner
      PVector vc = vertices[current];    // c for "current"
      PVector vn = vertices[next];       // n for "next"

      // check for collision between the circle and
      // a line formed between the two vertices
      boolean collision = lineCircle(vc.x, vc.y, vn.x, vn.y, enemy.position.x, enemy.position.y, ENEMYRADIUS);
      if (collision) return true;
    }

    // the above algorithm only checks if the circle
    // is touching the edges of the polygon – in most
    // cases this is enough, but you can un-comment the
    // following code to also test if the center of the
    // circle is inside the polygon

     boolean centerInside = polygonPoint(vertices, enemy.position.x, enemy.position.y);
     if (centerInside) return true;

    // otherwise, after all that, return false
    return false;
  }


  // LINE/CIRCLE
  boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

    // is either end INSIDE the circle?
    // if so, return true immediately
    boolean inside1 = pointCircle(x1, y1, cx, cy, r);
    boolean inside2 = pointCircle(x2, y2, cx, cy, r);
    if (inside1 || inside2) return true;

    // get length of the line
    float distX = x1 - x2;
    float distY = y1 - y2;
    float len = sqrt( (distX*distX) + (distY*distY) );

    // get dot product of the line and circle
    float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len, 2);

    // find the closest point on the line
    float closestX = x1 + (dot * (x2-x1));
    float closestY = y1 + (dot * (y2-y1));

    // is this point actually on the line segment?
    // if so keep going, but if not, return false
    boolean onSegment = linePoint(x1, y1, x2, y2, closestX, closestY);
    if (!onSegment) return false;

    // optionally, draw a circle at the closest point
    // on the line
    fill(255, 0, 0);
    noStroke();
    ellipse(closestX, closestY, 20, 20);

    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // is the circle on the line?
    if (distance <= r) {
      return true;
    }
    return false;
  }


  // LINE/POINT
  boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

    // get distance from the point to the two ends of the line
    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    // get the length of the line
    float lineLen = dist(x1, y1, x2, y2);

    // since floats are so minutely accurate, add
    // a little buffer zone that will give collision
    float buffer = 0.1;    // higher # = less accurate

    // if the two distances are equal to the line's
    // length, the point is on the line!
    // note we use the buffer here to give a range, rather
    // than one #
    if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
      return true;
    }
    return false;
  }


  // POINT/CIRCLE
  boolean pointCircle(float px, float py, float cx, float cy, float r) {

    // get distance between the point and circle's center
    // using the Pythagorean Theorem
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the circle's
    // radius the point is inside!
    if (distance <= r) {
      return true;
    }
    return false;
  }


  // POLYGON/POINT
  // only needed if you're going to check if the circle
  // is INSIDE the polygon
  boolean polygonPoint(PVector[] vertices, float px, float py) {
    boolean collision = false;

    // go through each of the vertices, plus the next
    // vertex in the list
    int next = 0;
    for (int current=0; current<vertices.length; current++) {

      // get next vertex in list
      // if we've hit the end, wrap around to 0
      next = current+1;
      if (next == vertices.length) next = 0;

      // get the PVectors at our current position
      // this makes our if statement a little cleaner
      PVector vc = vertices[current];    // c for "current"
      PVector vn = vertices[next];       // n for "next"

      // compare position, flip 'collision' variable
      // back and forth
      if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
        (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
        collision = !collision;
      }
    }
    return collision;
  }
}
