import 'package:flutter_rogue_like/models/logging/log.dart';
import 'package:flutter_rogue_like/models/entities/entity.dart';

class Logger {
  List<Log> _log;

  List<Log> get log {
    num start = _log.length - 10;
    if (start < 0) {
      start = 0;
    }
    _log = _log.sublist(start, _log.length).reversed.toList();
    return _log;
  }

  Logger() {
    _log = new List<Log>();
  }

  void logMovement(Entity e) {
    _log.add(new Log.logMovement(e));
  }
}
