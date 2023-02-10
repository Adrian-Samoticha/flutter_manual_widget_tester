import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/config/config.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

import 'infinite_scroll_view.dart';

class ThemedInteractiveInfiniteScrollView extends StatelessWidget {
  const ThemedInteractiveInfiniteScrollView({
    super.key,
    required this.currentValue,
    required this.onChanged,
    required this.lowerLimit,
    required this.upperLimit,
  });

  final double currentValue;
  final void Function(double) onChanged;
  final double lowerLimit;
  final double upperLimit;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          GestureBinding.instance.pointerSignalResolver.register(
            event,
            (event) {
              final scrollDelta = (event as PointerScrollEvent).scrollDelta;
              final newValue = currentValue +
                  (scrollDelta.dx + scrollDelta.dy) *
                      Config.of(context)
                          .doubleEditorInfiniteScrollViewScrollSpeedFactor;
              onChanged(newValue);
            },
          );
        }
      },
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          final panDelta = details.delta;
          final newValue = currentValue +
              (-panDelta.dx - panDelta.dy) *
                  Config.of(context)
                      .doubleEditorInfiniteScrollViewScrollSpeedFactor;
          onChanged(newValue);
        },
        child: Container(
          width: double.infinity,
          height: ManualWidgetTesterTheme.of(context)
              .doubleEditorTheme
              .infiniteScrollViewHeight,
          padding: ManualWidgetTesterTheme.of(context)
              .doubleEditorTheme
              .infiniteScrollViewPadding,
          decoration: ManualWidgetTesterTheme.of(context)
              .doubleEditorTheme
              .infiniteScrollViewBoxDecoration,
          clipBehavior: Clip.hardEdge,
          child: InfiniteScrollView(
            currentValue: currentValue,
            infiniteScrollViewRange:
                Config.of(context).doubleEditorInfiniteScrollViewRange,
            lowerLimit: lowerLimit,
            upperLimit: upperLimit,
          ),
        ),
      ),
    );
  }
}
