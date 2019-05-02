import 'package:flutter_rogue_like/game/entities/enemy/enemy.dart';

class EnemyManager {
  Map<int, List<Enemy>> _enemyMap;

  EnemyManager() : _enemyMap = new Map<int, List<Enemy>>();

  List<Enemy> getEnemies(int level) {
    return _enemyMap[level];
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

}
