import './map-tile-type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/models/coordinate.dart';

class MapTile {
  Coordinate coordinate;
  MapTileType mapTileType;
  Color color;
  IconData iconData;

  MapTile(this.coordinate, this.mapTileType, this.color, [this.iconData]);

  MapTile.grassTile(Coordinate coord)
      : this(coord, MapTileType.grass, Colors.green);

  MapTile.forestTile(Coordinate coord)
      : this(coord, MapTileType.forest, Colors.lightGreenAccent, Icons.usb);

  MapTile.waterTile(Coordinate coord)
      : this(coord, MapTileType.water, Colors.blue, Icons.invert_colors);

  MapTile.rockTile(Coordinate coord)
      : this(coord, MapTileType.rock, Colors.grey, Icons.change_history);
}
