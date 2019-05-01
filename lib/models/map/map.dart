import 'package:flutter_rogue_like/models/entities/entity.dart';
import 'package:flutter_rogue_like/models/entities/player.dart';
import 'package:flutter_rogue_like/models/map/map-tile.dart';
import 'package:flutter_rogue_like/models/map/map-data.dart';
import 'package:flutter_rogue_like/models/map/map-tile-type.dart';
import 'package:flutter_rogue_like/models/map/coordinate.dart';

class Map {
  static final num width = 9;
  static final num height = 10;
  List<MapTile> _mapTiles;

  List<MapTile> get mapTiles => _mapTiles;
  Player _player;

  Map() {
    _mapTiles = MapData().getMapData(width, height);
    _player = new Player(0, 0);
    addEntity(_player);
  }

  bool movePlayer(Coordinate newCoordinate) {
    return moveEntity(_player, newCoordinate);
  }

  bool moveEntity(Entity e, Coordinate nc) {
    Coordinate newCoordinate = e.coordinate + nc;
    if (isValidCoordinate(newCoordinate) &&
        !isImpassibleTerrain(newCoordinate)) {
      removeEntity(e);
      e.coordinate = newCoordinate;
      addEntity(e);
      return true;
    }
    return false;
  }

  // Just for testing.
  void updateMapData() {
    _mapTiles = MapData().getMapData(width, height);
  }

  void addEntity(Entity e) {
    this[e.coordinate].addEntity(e);
  }

  void removeEntity(Entity e) {
    this[e.coordinate].removeEntity(e);
  }

  bool isValidCoordinate(Coordinate c) {
    return c.x >= 0 && c.x < width && c.y >= 0 && c.y < height;
  }

  bool isImpassibleTerrain(Coordinate c) {
    return [MapTileType.rock, MapTileType.water].contains(this[c].mapTileType);
  }

  MapTile operator [](Coordinate c) {
    return _mapTiles[c.x + c.y * width];
  }

  void operator []=(Coordinate c, MapTile tile) {
    _mapTiles[c.x + c.y * width] = tile;
  }
}
