import './map-tile.dart';
import './map-data.dart';
import './entities/entity.dart';
import './entities/player.dart';
import 'package:flutter_rogue_like/models/coordinate.dart';

class Map {
  static final num width = 9;
  static final num height = 10;

  List<MapTile> _mapTiles;

  List<MapTile> get mapTiles => _mapTiles;

  Player player;

  Map() {
    _mapTiles = MapData().getMapData(width, height);
    player = new Player(0, 0);
    addEntity(player);
  }

  void addEntity(Entity e) {
    this[e.coordinate].addEntity(e);
  }

  // Just for testing.
  void updateMapData() {
    _mapTiles = MapData().getMapData(width, height);
  }

  bool isValidCoordinate(Coordinate c) {
    return c.x >= 0 && c.x < width && c.y >= 0 && c.y < height;
  }

  MapTile operator [](Coordinate c) {
    return _mapTiles[c.x + c.y * width];
  }

  void operator []=(Coordinate c, MapTile tile) {
    _mapTiles[c.x + c.y * width] = tile;
  }
}
