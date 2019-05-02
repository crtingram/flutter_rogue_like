import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';

class Entity {
  Coordinate coordinate;
  IconData iconData;
  Color color;

  Entity(this.coordinate, this.iconData, [this.color]);
}
