class ManualWidgetTesterConfig {
  /// Creates a configuration object for the [ManualWidgetTester].
  ///
  /// The [doubleEditorInfiniteScrollViewRange] is the range of the double
  /// editor infinite scroll view.
  ///
  /// The [doubleEditorInfiniteScrollViewScrollSpeedFactor] is the scroll speed
  /// factor of the double editor infinite scroll view.
  ManualWidgetTesterConfig(
      {required this.doubleEditorInfiniteScrollViewRange,
      required this.doubleEditorInfiniteScrollViewScrollSpeedFactor});

  /// The range of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewRange;

  /// The scroll speed factor of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;
}
