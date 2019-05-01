import 'package:flutter_rogue_like/models/map/coordinate.dart';
import 'package:flutter/material.dart';

class Entity {
  Coordinate coordinate;
  IconData iconData;
  Color color;

  Entity(this.coordinate, this.iconData, [this.color]);
}
