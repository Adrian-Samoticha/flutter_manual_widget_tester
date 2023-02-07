import 'package:flutter/material.dart';

import 'resize_handle.dart';

class ResizableCorners extends StatelessWidget {
  const ResizableCorners({
    super.key,
    required this.width,
    required this.height,
    required this.onHorizontalDragStart,
    required this.onHorizontalDragUpdate,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
  });

  final double width;
  final double height;
  final void Function() onHorizontalDragStart;
  final void Function(double) onHorizontalDragUpdate;
  final void Function() onVerticalDragStart;
  final void Function(double) onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ResizeHandle(
          isRight: false,
          isBottom: false,
          width: width,
          height: height,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onVerticalDragStart: onVerticalDragStart,
          onVerticalDragUpdate: onVerticalDragUpdate,
        ),
        ResizeHandle(
          isRight: true,
          isBottom: false,
          width: width,
          height: height,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onVerticalDragStart: onVerticalDragStart,
          onVerticalDragUpdate: onVerticalDragUpdate,
        ),
        ResizeHandle(
          isRight: false,
          isBottom: true,
          width: width,
          height: height,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onVerticalDragStart: onVerticalDragStart,
          onVerticalDragUpdate: onVerticalDragUpdate,
        ),
        ResizeHandle(
          isRight: true,
          isBottom: true,
          width: width,
          height: height,
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onVerticalDragStart: onVerticalDragStart,
          onVerticalDragUpdate: onVerticalDragUpdate,
        ),
      ],
    );
  }
}
