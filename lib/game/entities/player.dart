import './entity.dart';
import 'package:flutter_rogue_like/models/map/coordinate.dart';
import 'package:flutter/material.dart';

class Player extends Entity {
  Player.fromCoordinate(Coordinate coordinate)
      : super(coordinate, Icons.face, Colors.black);

  Player(int x, int y) : super(new Coordinate(x, y), Icons.face, Colors.black);
}
