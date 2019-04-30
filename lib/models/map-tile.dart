import './map-tile-type.dart';
import 'package:flutter/material.dart';

class MapTile {
  MapTileType mapTileType;
  Color color;
  IconData iconData;

  MapTile(this.mapTileType, this.color, [this.iconData]);

  MapTile.grassTile() : this(MapTileType.grass, Colors.green);

  MapTile.forestTile()
      : this(MapTileType.forest, Colors.lightGreenAccent, Icons.usb);

  MapTile.waterTile() : this(MapTileType.water, Colors.blue, Icons.invert_colors);

  MapTile.rockTile() : this(MapTileType.rock, Colors.grey, Icons.change_history);
}
