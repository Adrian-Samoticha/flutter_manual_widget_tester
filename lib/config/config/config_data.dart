class ConfigData {
  /// Creates a [ConfigData].
  ///
  /// The [doubleEditorInfiniteScrollViewRange] is the range of the double
  /// editor infinite scroll view.
  ///
  /// The [doubleEditorInfiniteScrollViewScrollSpeedFactor] is the scroll speed
  /// factor of the double editor infinite scroll view.
  const ConfigData(
      {required this.doubleEditorInfiniteScrollViewRange,
      required this.doubleEditorInfiniteScrollViewScrollSpeedFactor});

  /// The range of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewRange;

  /// The scroll speed factor of the double editor infinite scroll view.
  final double doubleEditorInfiniteScrollViewScrollSpeedFactor;

  @override
  bool operator ==(other) =>
      other is ConfigData &&
      doubleEditorInfiniteScrollViewRange ==
          other.doubleEditorInfiniteScrollViewRange &&
      doubleEditorInfiniteScrollViewScrollSpeedFactor ==
          other.doubleEditorInfiniteScrollViewScrollSpeedFactor;

  @override
  int get hashCode => Object.hash(doubleEditorInfiniteScrollViewRange,
      doubleEditorInfiniteScrollViewScrollSpeedFactor);
}
