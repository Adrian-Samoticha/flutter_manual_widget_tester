import 'package:flutter/material.dart';

class ManualWidgetTesterBackground extends StatelessWidget {
  const ManualWidgetTesterBackground({Key? key, required this.color})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
