import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:num_remap/num_remap.dart';

class InfiniteScrollView extends StatelessWidget {
  const InfiniteScrollView({
    Key? key,
    required this.currentValue,
    required this.infiniteScrollViewRange,
    required this.lowerLimit,
    required this.upperLimit,
  }) : super(key: key);

  final double currentValue;
  final double infiniteScrollViewRange;
  final double lowerLimit;
  final double upperLimit;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InfiniteScrollViewPainter(
        value: currentValue,
        range: infiniteScrollViewRange,
        lowerLimit: lowerLimit,
        upperLimit: upperLimit,
        context: context,
      ),
    );
  }
}

class _InfiniteScrollViewPainter extends CustomPainter {
  final double value;
  final double range;
  final double lowerLimit;
  final double upperLimit;
  final BuildContext context;

  _InfiniteScrollViewPainter(
      {required this.value,
      required this.range,
      required this.lowerLimit,
      required this.upperLimit,
      required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = ManualWidgetTesterTheme.of(context)
          .doubleEditorTheme
          .doubleEditorInfiniteScrollViewLineColor
      ..strokeWidth = ManualWidgetTesterTheme.of(context)
          .doubleEditorTheme
          .doubleEditorInfiniteScrollViewLineWidth;

    final indicatorPaint = Paint()
      ..color = ManualWidgetTesterTheme.of(context)
          .doubleEditorTheme
          .doubleEditorInfiniteScrollViewIndicatorColor
      ..strokeWidth = ManualWidgetTesterTheme.of(context)
          .doubleEditorTheme
          .doubleEditorInfiniteScrollViewIndicatorWidth;

    _drawRuler(canvas, size, linePaint, 1.0, 1.0);
    _drawRuler(canvas, size, linePaint, 0.5, 0.5);
    _drawRuler(canvas, size, linePaint, 0.1, 0.1);

    _drawRulerNumbers(canvas, size);

    _drawBottomLineAtValue(
        value,
        canvas,
        size,
        indicatorPaint,
        ManualWidgetTesterTheme.of(context)
            .doubleEditorTheme
            .doubleEditorInfiniteScrollViewIndicatorHeight);
  }

  void _drawRuler(Canvas canvas, Size size, Paint paint, double stepSize,
      double heightFactor) {
    final leftEdgeValue = value - range * 0.5;
    final rightEdgeValue = value + range * 0.5;

    final flooredValue = value.floorToDouble();

    for (var i = flooredValue; i <= rightEdgeValue; i += stepSize) {
      _drawTopLineAtValueIfWithinLimit(i, canvas, size, paint, heightFactor);
    }

    for (var i = flooredValue; i >= leftEdgeValue; i -= stepSize) {
      _drawTopLineAtValueIfWithinLimit(i, canvas, size, paint, heightFactor);
    }
  }

  void _drawRulerNumbers(Canvas canvas, Size size) {
    final leftEdgeValue = value - range * 0.5;
    final rightEdgeValue = value + range * 0.5;

    final flooredValue = value.floorToDouble();

    for (var i = flooredValue; i <= rightEdgeValue; i += 1.0) {
      _drawRulerNumberAtValueIfWithinLimit(i, canvas, size);
    }

    for (var i = flooredValue; i >= (leftEdgeValue - 1.0); i -= 1.0) {
      _drawRulerNumberAtValueIfWithinLimit(i, canvas, size);
    }
  }

  void _drawRulerNumberAtValueIfWithinLimit(
      double valueToDrawTheRulerNumberAt, Canvas canvas, Size size) {
    if (!valueToDrawTheRulerNumberAt.isWithinRange(lowerLimit, upperLimit)) {
      return;
    }

    final textPositionLeft =
        _valueToPosition(valueToDrawTheRulerNumberAt, size.width) +
            ManualWidgetTesterTheme.of(context)
                .doubleEditorTheme
                .doubleEditorInfiniteScrollViewTextPaddingAmount;
    final textPositionRight =
        _valueToPosition(valueToDrawTheRulerNumberAt + 1.0, size.width) -
            ManualWidgetTesterTheme.of(context)
                .doubleEditorTheme
                .doubleEditorInfiniteScrollViewTextPaddingAmount;

    final textSpan = TextSpan(
      text: valueToDrawTheRulerNumberAt.floor().toString(),
      style: ManualWidgetTesterTheme.of(context)
          .doubleEditorTheme
          .doubleEditorInfiniteScrollViewTextStyle,
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

  void _drawTopLineAtValueIfWithinLimit(double valueToDrawTheLineAt,
      Canvas canvas, Size size, Paint paint, double heightFactor) {
    if (!valueToDrawTheLineAt.isWithinRange(lowerLimit, upperLimit)) {
      return;
    }

    final position = _valueToPosition(valueToDrawTheLineAt, size.width);
    canvas.drawLine(
      Offset(position, 0.0),
      Offset(position, size.height * heightFactor),
      paint,
    );
  }

  void _drawBottomLineAtValue(double valueToDrawTheLineAt, Canvas canvas,
      Size size, Paint paint, double heightFactor) {
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
