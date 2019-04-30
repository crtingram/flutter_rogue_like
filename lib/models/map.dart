import './map-tile.dart';
import './map-data.dart';

class Map {
  static final num width = 9;
  static final num height = 10;

  List<MapTile> _mapTiles;

  List<MapTile> get mapTiles => _mapTiles;

  Map() : _mapTiles = MapData().getMapData(width, height);
}
