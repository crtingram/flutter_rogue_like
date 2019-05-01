import './entity.dart';
import 'package:flutter_rogue_like/models/coordinate.dart';
import 'package:flutter/material.dart';

class Player extends Entity {
  Player(Coordinate coordinate) : super(coordinate, Icons.face, Colors.black);
}
