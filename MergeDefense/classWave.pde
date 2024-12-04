
class Wave {
  int[] spawns;
  int framesSinceStart;
  int waveLength;
  int enemyHealth;
  
  Wave(int round) {
    framesSinceStart = 0;
    enemyHealth = EnemyHealthBase + int(round * EnemyHealthMultiplier);
    waveLength = WaveLengthBase + int(round * WaveLengthMultiplier);
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
    float timeBetweenSpawns = BaseTimeBetweenSpawns / round;
    for (float i = 0; i < waveLength; i += timeBetweenSpawns) {
      spawns[int(i)] += enemyHealth;
    }
  }
  
  void addClusters(int round) {
    if (round < 4) return;
    int halfHealth = enemyHealth / 2;
    float clusterLength = BaseClusterLength + round * ClusterLengthModifier;
    float distanceBetweenClusters = clusterLength * ClusterDistanceMultiplier;
    float distanceBetweenEnemies = BaseDistanceBetweenEnemies * pow(DistanceBetweenEnemiesMultiplier, round - 1);
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
