import './map-tile.dart';
import './map-data.dart';
import './entities/entity.dart';
import './entities/player.dart';

class Map {
  static final num width = 9;
  static final num height = 10;

  List<MapTile> _mapTiles;
  List<MapTile> get mapTiles => _mapTiles;

  Player player;

  Map() : _mapTiles = MapData().getMapData(width, height),
  player = new Player(0,0);
}
