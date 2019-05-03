import 'package:flutter_rogue_like/game/map/map.dart';
import 'package:flutter_rogue_like/game/entities/entity.dart';
import 'package:flutter_rogue_like/game/map/coordinate.dart';
import 'dart:math' show Random;

class MovementManager {
  Random _random;

  MovementManager() {
    _random = new Random();
  }

  void moveEntities(Map map, List<Entity> entities) {
    entities.forEach((Entity e) {
      List<Coordinate> validCoordinates = _getValidAdjacentCoordinates(map, e);
      if (validCoordinates.length > 0) {
        map.moveEntity(
            e, validCoordinates[_random.nextInt(validCoordinates.length)]);
      }
    });
  }

  List<Coordinate> _getValidAdjacentCoordinates(Map map, Entity e) {
    List<Coordinate> validCoordinates = new List();
    Coordinate entityCoordinate = e.coordinate;

    [
      Coordinate.north(),
      Coordinate.south(),
      Coordinate.west(),
      Coordinate.east()
    ].forEach((Coordinate c) {
      if (map.isValidCoordinate(entityCoordinate + c)) {
        validCoordinates.add(c);
      }
    });

    return validCoordinates;
  }
}
