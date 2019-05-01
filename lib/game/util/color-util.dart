import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorUtil {
  static Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }
}
