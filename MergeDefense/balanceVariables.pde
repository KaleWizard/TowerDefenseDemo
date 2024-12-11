
////////////////////////////////////////////////////////////////////
// MONEY VARIABLES
////////////////////////////////////////////////////////////////////

// Starting Gold
int StartingGold = 14;

// Shop Cost variables
int typeOneCost = 7;
int typeTwoCost = 23;
int typeThreeCost = 70;

// Enemy Kill Bounty
int enemyKillReward = 1;


////////////////////////////////////////////////////////////////////
// ENEMY WAVE VARIABLES
////////////////////////////////////////////////////////////////////

// Player Stats
int BaseHealth = 99;

// Enemy Stats
int EnemyHealthBase = 2;
float EnemyHealthMultiplier = 3;
float EnemySpeed = 3;

// Wave Length
int WaveLengthBase = 180;
float WaveLengthMultiplier = 15;

// Drip feed spawns
float BaseTimeBetweenSpawns = 60;
float TimeBetweenSpawnsMultiplier = 0.95;

// Cluster spawns
int BaseClusterLength = 4;
float ClusterLengthModifier = 0.25;
float ClusterDistanceMultiplier = 5;
float BaseDistanceBetweenEnemies = 12;
float DistanceBetweenEnemiesMultiplier = 0.9;


////////////////////////////////////////////////////////////////////
// TURRET STAT VARIABLES
////////////////////////////////////////////////////////////////////

// Long Range (Type 1)
int LongDamage = 2;
int LongRange = 550;
int LongDelay = 40;
int LongExplosionRadius = 0;
int LongRayWidth = 0;

// Ray (Type 2)
int RayDamage = 4;
int RayRange = 400;
int RayDelay = 75;
int RayExplosionRadius = 0;
int RayRayWidth = 50;

// Explosion (Type 3)
int ExplosionDamage = 10;
int ExplosionRange = 125;
int ExplosionDelay = 120;
int ExplosionExplosionRadius = 200;
int ExplosionRayWidth = 0;

// Damage modifiers
float LRngDecay = 1;
float RayDecay = 1;
float ExpDecay = 1;

float LRngRayDecay = 0.7;
float LRngExpDecay = 0.8;
float RayExpDecay = 1.5;

float LRngRayExpDecay = 0.6;
