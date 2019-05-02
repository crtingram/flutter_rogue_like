import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/game/entities/entity.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';

abstract class Enemy extends Entity {
  int healthPoints;
  int attackPower;
  int fieldOfView;

  Enemy.snake(int x, int y)
      : healthPoints = 1,
        attackPower = 1,
        fieldOfView = 5,
        super(new Coordinate(x, y), Icons.gesture, Colors.lightGreenAccent);

  void move();

  void decrementHealthPoints(int attack) {
    healthPoints -= attack;
  }

  bool isDead() {
    return healthPoints <= 0;
  }
}
