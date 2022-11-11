import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(color),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color dottedLineColor;

  _DottedLinePainter(this.dottedLineColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = dottedLineColor;

    final x = size.width * 0.5;
    for (var y = 0.0; y < size.height; y += 4.0) {
      canvas.drawCircle(Offset(x, y), 1.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
