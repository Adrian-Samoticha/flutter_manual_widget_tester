import 'package:flutter/rendering.dart';

extension ClampSaturation on HSLColor {
  HSLColor clampSaturation(double lowerLimit, double upperLimit) =>
      withSaturation(saturation.clamp(lowerLimit, upperLimit));
}
