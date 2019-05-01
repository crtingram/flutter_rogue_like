import './map-tile-type.dart';
import './map-tile-contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/models/coordinate.dart';

class MapTile {
  Coordinate coordinate;
  MapTileType mapTileType;
  Color color;
  IconData iconData;
  MapTileContents contents = new MapTileContents();

  MapTile(this.coordinate, this.mapTileType, this.color, [this.iconData]);

  MapTile.grassTile(Coordinate coordinate)
      : this(coordinate, MapTileType.grass, Colors.green);

  MapTile.forestTile(Coordinate coordinate)
      : this(
            coordinate, MapTileType.forest, Colors.lightGreenAccent, Icons.usb);

  MapTile.waterTile(Coordinate coordinate)
      : this(coordinate, MapTileType.water, Colors.blue, Icons.invert_colors);

  MapTile.rockTile(Coordinate coordinate)
      : this(coordinate, MapTileType.rock, Colors.grey, Icons.change_history);
}
