import 'package:flutter/material.dart';

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
}
