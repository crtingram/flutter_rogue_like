import 'package:flutter_rogue_like/game/map/map.dart';
import 'package:flutter_rogue_like/game/entity_manager/enemy-manager.dart';
import 'package:flutter_rogue_like/game/entity_manager/movement-manager.dart';
import 'package:flutter_rogue_like/game/entities/player.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';
import 'package:flutter_rogue_like/game/map/map-tile.dart';
import 'package:flutter_rogue_like/game/logging/logger.dart';
import 'package:flutter_rogue_like/game/logging/log.dart';
import 'package:flutter_rogue_like/game/entities/enemy/enemy.dart';

class Game {
  Map _map;
  Player _player;
  EnemyManager _enemyManager;
  Logger _logger;
  MovementManager _movementManager;

  Map get map => _map;

  EnemyManager get enemyManager => _enemyManager;

  Player get player => _player;

  List<Log> get logs => _logger.log;

  Game() {
    _map = new Map();
    _player = new Player(0, 0);
    _enemyManager = new EnemyManager();
    _logger = new Logger();
    _movementManager = new MovementManager();

    updateMapData();
  }

  bool movePlayer(Coordinate c) {
    bool moved = _map.moveEntity(_player, c);
    if (moved) {
      _logger.logMovement(_player);
      // only going here for now.
      _movementManager.moveEntities(_map, enemyManager.getEnemies(1));
    }
    return moved;
  }

  void removeDeadEnemies() {
    List<Enemy> toRemove = new List<Enemy>();
    _enemyManager.getEnemies(1).forEach((Enemy e) {
      if (e.isDead()) {
        toRemove.add(e);
      }
    });
    _enemyManager.removeEnemies(1, toRemove);
    _map.removeEntities(toRemove);
  }

  List<MapTile> getMapTiles() {
    return _map.mapTiles;
  }

  // For testing only
  void updateMapData() {
    _map.updateMapData();
    _map.addEntity(_player);
    _enemyManager.addLevel(1);
    _enemyManager.generateEnemies(1, _map.getValidCoordinates());
    _map.addEntities(_enemyManager.getEnemies(1));
  }
}
