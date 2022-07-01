import 'package:flutter/material.dart';

class ManualWidgetTesterAppbar extends StatelessWidget {
  const ManualWidgetTesterAppbar({Key? key, required this.height, required this.sidebarColor}) : super(key: key);
  
  final double height;
  final Color sidebarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: sidebarColor,
    );
  }
}