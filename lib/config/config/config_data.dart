import 'package:equatable/equatable.dart';

class ConfigData extends Equatable {
  /// Creates a [ConfigData].
  ///
  /// The [doubleEditorInfiniteScrollViewRange] is the range of the double
  /// editor infinite scroll view.
  ///
  /// The [doubleEditorInfiniteScrollViewScrollSpeedFactor] is the scroll speed
  /// factor of the double editor infinite scroll view.
  const ConfigData({
    required this.doubleEditorInfiniteScrollViewRange,
    required this.doubleEditorInfiniteScrollViewScrollSpeedFactor,
  });

  /// The range of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewRange;

  /// The scroll speed factor of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;

  @override
  List<Object?> get props => [
        doubleEditorInfiniteScrollViewRange,
        doubleEditorInfiniteScrollViewScrollSpeedFactor,
      ];
}
