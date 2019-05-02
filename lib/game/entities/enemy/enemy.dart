import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/game/entities/entity.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';

class Enemy extends Entity {
  int healthPoints;
  int attackPower;
  int fieldOfView;

  Enemy.snake(Coordinate coordinate)
      : healthPoints = 1,
        attackPower = 1,
        fieldOfView = 5,
        super(coordinate, Icons.gesture, Colors.lightGreenAccent);

  void decrementHealthPoints(int attack) {
    healthPoints -= attack;
  }

  bool isDead() {
    return healthPoints <= 0;
  }
}
