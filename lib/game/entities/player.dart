import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';
import 'package:flutter_rogue_like/game/entities/entity.dart';

class Player extends Entity {
  Player.fromCoordinate(Coordinate coordinate)
      : super(coordinate, Icons.face, Colors.black);

  Player(int x, int y) : super(new Coordinate(x, y), Icons.face, Colors.black);
}
