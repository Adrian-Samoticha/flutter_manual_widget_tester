import 'package:flutter/rendering.dart';

extension MultiplySaturation on HSLColor {
  HSLColor multiplySaturation(double factor) =>
      withSaturation(factor * saturation);
}
