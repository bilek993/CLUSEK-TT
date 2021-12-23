import 'dart:math';

import 'package:flutter/animation.dart';

extension IntegerBitwiseOperationsExtension on AnimationController {
  double get easeOutQuartValue => 1 - pow(1 - value, 4).toDouble();
}
