import 'package:flutter/rendering.dart';

extension ClampLightness on HSLColor {
  HSLColor clampLightness(double lowerLimit, double upperLimit) =>
      withLightness(lightness.clamp(lowerLimit, upperLimit));
}
