import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/game/entities/entity.dart';
import 'package:flutter_rogue_like/game/util/color-util.dart';

class Log {
  Color color;
  IconData iconData;
  String title, subTitle;

  Log(this.color, this.iconData, this.title, this.subTitle);

  Log.logMovement(Entity e)
      : this(ColorUtil.getRandomColor(), e.iconData, 'Moved', e.toString());
}
