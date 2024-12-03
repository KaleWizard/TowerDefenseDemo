
class Wave {
  int[] spawns;
  int framesSinceStart;
  int waveLength;
  int enemyHealth;
  
  Wave(int round) {
    framesSinceStart = 0;
    enemyHealth = 3 + (round / 3) * 2;
    waveLength = 180 + 30 * (round / 2);
    spawns = new int[waveLength];
    addDripFeed(round);
    addClusters(round);
  }
  
  void spawnEnemy(ArrayList<Enemy> enemies, Path p) {
    if (isDone()) return;
    if (spawns[framesSinceStart] > 0) {
      enemies.add(new Enemy(spawns[framesSinceStart], p));
    }
    framesSinceStart++;
  }
  
  void addDripFeed(int round) {
    float timeBetweenSpawns = 30.0 / round;
    for (float i = 0; i < waveLength; i += timeBetweenSpawns) {
      spawns[int(i)] += enemyHealth;
    }
  }
  
  void addClusters(int round) {
    if (round < 4) return;
    int halfHealth = enemyHealth / 2;
    float clusterLength = 4 + round / 6;
    float distanceBetweenClusters = clusterLength * 4;
    float distanceBetweenEnemies = 12.0 / round;
    for (float i = 0; i < waveLength; i += distanceBetweenClusters) {
      for (float j = 0; j < clusterLength && i + j < waveLength; j += distanceBetweenEnemies) {
        spawns[int(i + j)] += halfHealth;
      }
    }
  }
  
  boolean isDone() {
    return waveLength == framesSinceStart;
  }
}
