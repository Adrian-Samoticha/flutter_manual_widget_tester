import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class TabLightReflection extends StatelessWidget {
  const TabLightReflection({
    Key? key,
    required this.isFocused,
  }) : super(key: key);

  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !isFocused
          ? null
          : ManualWidgetTesterTheme.of(context)
              .tabTheme
              .lightReflectionBoxDecoration,
    );
  }
}
