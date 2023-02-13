import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(color),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  _DottedLinePainter(this.dottedLineColor);

  final Color dottedLineColor;

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
