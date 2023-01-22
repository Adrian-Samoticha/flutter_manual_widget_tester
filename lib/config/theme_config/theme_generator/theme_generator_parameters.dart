import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/util/clamp_lightness.dart';
import 'package:flutter_manual_widget_tester/util/clamp_saturation.dart';

import 'animation_speed.dart';
import 'design_language.dart';
import 'layout.dart';

export 'animation_speed.dart';
export 'design_language.dart';
export 'layout.dart';

class ThemeGeneratorParameters {
  final Brightness brightness;
  final Color backgroundColor;
  final Color primaryColor;
  final AnimationSpeed animationSpeed;
  final Layout layout;
  final DesignLanguage designLanguage;

  ThemeGeneratorParameters(
      {this.brightness = Brightness.dark,
      this.backgroundColor = Colors.blue,
      this.primaryColor = Colors.blue,
      this.animationSpeed = AnimationSpeed.normal,
      this.layout = Layout.normal,
      this.designLanguage = DesignLanguage.skeuomorphic});

  Color get filteredBackgroundColor {
    if (brightness == Brightness.dark) {
      return HSLColor.fromColor(backgroundColor)
          .clampLightness(0.0, 0.2)
          .clampSaturation(0.0, 0.5)
          .toColor();
    }

    return HSLColor.fromColor(backgroundColor)
        .clampLightness(0.95, 1.0)
        .clampSaturation(0.0, 0.2)
        .toColor();
  }
}
