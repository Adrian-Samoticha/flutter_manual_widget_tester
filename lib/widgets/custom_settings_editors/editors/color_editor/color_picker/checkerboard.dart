import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class Checkerboard extends StatelessWidget {
  const Checkerboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CheckerboardPainter(
        ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .editColorButtonCheckerboardSize,
        ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .editColorButtonCheckerboardColor1,
        ManualWidgetTesterTheme.of(context)
            .editColorButtonTheme
            .editColorButtonCheckerboardColor2,
      ),
    );
  }
}

class _CheckerboardPainter extends CustomPainter {
  final double tileSize;
  final Color color1;
  final Color color2;

  _CheckerboardPainter(this.tileSize, this.color1, this.color2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = color1;

    final paint2 = Paint()..color = color2;

    final widthInTiles = size.width / tileSize;
    final heightInTiles = size.height / tileSize;

    for (var x = 0; x < widthInTiles; x += 1) {
      for (var y = 0; y < heightInTiles; y += 1) {
        final paint = (x + y) % 2 == 0 ? paint1 : paint2;
        final rect =
            Rect.fromLTWH(x * tileSize, y * tileSize, tileSize, tileSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
