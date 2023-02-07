import 'package:flutter/material.dart';

class ManualWidgetTesterBackground extends StatelessWidget {
  const ManualWidgetTesterBackground({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
