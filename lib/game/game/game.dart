import 'package:flutter_rogue_like/game/map/map.dart';
import 'package:flutter_rogue_like/game/entities/player.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';
import 'package:flutter_rogue_like/game/map/map-tile.dart';
import 'package:flutter_rogue_like/game/logging/logger.dart';
import 'package:flutter_rogue_like/game/logging/log.dart';

class Game {
  Map _map;
  Player _player;
  Logger _logger = new Logger();

  Map get map => _map;

  Player get player => _player;

  List<Log> get logs => _logger.log;

  Game() {
    _map = new Map();
    _player = new Player(0, 0);
    _map.addEntity(_player);
  }

  bool movePlayer(Coordinate c) {
    bool moved = _map.moveEntity(_player, c);
    if (moved) {
      _logger.logMovement(_player);
    }
    return moved;
  }

  List<MapTile> getMapTiles() {
    return _map.mapTiles;
  }

  // For testing only
  void updateMapData() {
    _map.updateMapData();
    _map.addEntity(_player);
  }
}
