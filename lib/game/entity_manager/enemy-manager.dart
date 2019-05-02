import 'package:flutter_rogue_like/game/entities/enemy/enemy.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';
import 'dart:math' show Random;

class EnemyManager {
  Map<int, List<Enemy>> _enemyMap;

  EnemyManager() {
    _enemyMap = new Map<int, List<Enemy>>();
    addLevel(1);
  }

  List<Enemy> getEnemies(int level) {
    return _enemyMap[level];
  }

  void addLevel(int level) {
    _enemyMap[level] = new List<Enemy>();
  }

  void addEnemy(int level, Enemy e) {
    _enemyMap[level].add(e);
  }

  void addEnemies(int level, List<Enemy> e) {
    _enemyMap[level].addAll(e);
  }

  void removeEnemy(int level, Enemy e) {
    _enemyMap[level].remove(e);
  }

  void removeEnemies(int level, List<Enemy> e) {
    e.forEach((Enemy enemy) {
      _enemyMap[level].remove(enemy);
    });
  }

  void generateEnemies(int level, List<Coordinate> validCoordinates) {
    Random _random = new Random();
    for (int i = 0; i < 2; i++) {
      int randomIndex = _random.nextInt(validCoordinates.length);
      Enemy snake = new Enemy.snake(validCoordinates[randomIndex]);
      addEnemy(level, snake);
    }
  }
}
