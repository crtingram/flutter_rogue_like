import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/models/entities/entity.dart';
import 'dart:math' as math;

class Log {
  Color color;
  IconData iconData;
  String title, subTitle;

  Log(this.color, this.iconData, this.title, this.subTitle);

  Log.logMovement(Entity e)
      : this(Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0), e.iconData, 'Moved', e.toString());
}
