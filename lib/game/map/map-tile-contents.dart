import 'package:flutter_rogue_like/game/entities/entity.dart';

class MapTileContents {
  List<Entity> _contents;

  MapTileContents() : _contents = new List<Entity>();

  List<Entity> get contents {
    return _contents;
  }

  num get length {
    return _contents.length;
  }

  void addEntity(Entity e) {
    _contents.add(e);
  }

  void addEntities(List<Entity> e) {
    _contents.addAll(e);
  }

  void removeEntity(Entity e) {
    _contents.remove(e);
  }
}
