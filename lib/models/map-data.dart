import './map-tile.dart';
import 'dart:math' show Random;

class MapData {
  List<MapTile> _mapTiles = new List<MapTile>();

  List<MapTile> getMapData(num width, num height) {
    Random _random = new Random();

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        if (_random.nextInt(100) % 20 == 0) {
          _mapTiles.add(MapTile.waterTile());
        } else if (_random.nextInt(100) % 4 == 0) {
          _mapTiles.add(MapTile.forestTile());
        } else {
          _mapTiles.add(MapTile.grassTile());
        }
      }
    }
    return _mapTiles;
  }
}
