import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:num_remap/num_remap.dart';

class InfiniteScrollView extends StatelessWidget {
  const InfiniteScrollView({
    Key? key,
    required this.themeSettings,
    required this.currentValue,
    required this.infiniteScrollViewRange,
  }) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final double currentValue;
  final double infiniteScrollViewRange;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InfiniteScrollViewPainter(themeSettings, currentValue, infiniteScrollViewRange),
    );
  }
}

class _InfiniteScrollViewPainter extends CustomPainter {
  final double value;
  final double range;
  final ManualWidgetTesterThemeSettings themeSettings;

  _InfiniteScrollViewPainter(this.themeSettings, this.value, this.range);
  
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = themeSettings.doubleEditorInfiniteScrollViewLineColor
      ..strokeWidth = themeSettings.doubleEditorInfiniteScrollViewLineWidth;
    
    final indicatorPaint = Paint()
      ..color = themeSettings.doubleEditorInfiniteScrollViewIndicatorColor
      ..strokeWidth = themeSettings.doubleEditorInfiniteScrollViewIndicatorWidth;
    
    _drawRuler(canvas, size, linePaint, 1.0, 1.0);
    _drawRuler(canvas, size, linePaint, 0.5, 0.5);
    _drawRuler(canvas, size, linePaint, 0.1, 0.1);
    
    _drawRulerNumbers(canvas, size);
    
    _drawBottomLineAtValue(value, canvas, size, indicatorPaint, themeSettings.doubleEditorInfiniteScrollViewIndicatorHeight);
  }
  
  void _drawRuler(Canvas canvas, Size size, Paint paint, double stepSize, double heightFactor) {
    final leftEdgeValue = value - range * 0.5;
    final rightEdgeValue = value + range * 0.5;
    
    final flooredValue = value.floorToDouble();
    
    for (var i = flooredValue; i <= rightEdgeValue; i += stepSize) {
      _drawTopLineAtValue(i, canvas, size, paint, heightFactor);
    }
    
    for (var i = flooredValue; i >= leftEdgeValue; i -= stepSize) {
      _drawTopLineAtValue(i, canvas, size, paint, heightFactor);
    }
  }
  
  void _drawRulerNumbers(Canvas canvas, Size size) {
    final leftEdgeValue = value - range * 0.5;
    final rightEdgeValue = value + range * 0.5;
    
    final flooredValue = value.floorToDouble();
    
    for (var i = flooredValue; i <= rightEdgeValue; i += 1.0) {
      _drawRulerNumberAtValue(i, canvas, size);
    }
    
    for (var i = flooredValue; i >= (leftEdgeValue - 1.0); i -= 1.0) {
      _drawRulerNumberAtValue(i, canvas, size);
    }
  }
  
  void _drawRulerNumberAtValue(double valueToDrawTheRulerNumberAt, Canvas canvas, Size size) {
    final textPositionLeft = _valueToPosition(valueToDrawTheRulerNumberAt, size.width) + themeSettings.doubleEditorInfiniteScrollViewTextPaddingAmount;
    final textPositionRight = _valueToPosition(valueToDrawTheRulerNumberAt + 1.0, size.width) - themeSettings.doubleEditorInfiniteScrollViewTextPaddingAmount;
    
    final textSpan = TextSpan(
      text: valueToDrawTheRulerNumberAt.floor().toString(),
      style: themeSettings.doubleEditorInfiniteScrollViewTextStyle,
    );
    
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      ellipsis: '…',
    )..layout(
      maxWidth: textPositionRight - textPositionLeft,
    );
    
    textPainter.paint(
      canvas,
      Offset(
        textPositionLeft,
        size.height - textPainter.height,
      ),
    );
  }
  
  void _drawTopLineAtValue(double valueToDrawTheLineAt, Canvas canvas, Size size, Paint paint, double heightFactor) {
    final position = _valueToPosition(valueToDrawTheLineAt, size.width);
    canvas.drawLine(
      Offset(position, 0.0),
      Offset(position, size.height * heightFactor),
      paint,
    );
  }
  
  void _drawBottomLineAtValue(double valueToDrawTheLineAt, Canvas canvas, Size size, Paint paint, double heightFactor) {
    final position = _valueToPosition(valueToDrawTheLineAt, size.width);
    canvas.drawLine(
      Offset(position, size.height * (1.0 - heightFactor)),
      Offset(position, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  
  double _valueToPosition(double valueToBeRemapped, double width) {
    final leftEdgeValue = value - range * 0.5;
    final rightEdgeValue = value + range * 0.5;
    
    return valueToBeRemapped.remap(leftEdgeValue, rightEdgeValue, 0.0, width);
  }
}