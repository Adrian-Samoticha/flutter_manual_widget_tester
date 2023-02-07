class ClampedDouble {
  /// Creates a [ClampedDouble] whose [value] is guaranteed to be clamped to be
  /// in the range [lowerLimit]-[upperLimit].
  ///
  /// It is intended to be used in conjunction with
  /// [WidgetTestSessionCustomSettings.getSetting] to create a custom setting
  /// whose value is a clamped double.
  ///
  /// Usage example:
  /// ```dart
  /// WidgetTestBuilder(
  ///   id: 'my widget',
  ///   name: 'MyWidget',
  ///   builder: (context, settings) {
  ///     final someDouble = settings
  ///         .getSetting('someDouble',
  ///             ClampedDouble(lowerLimit: 0.5, value: 0.5, upperLimit: 1.5))
  ///         .value;
  ///
  ///     return MyWidget(
  ///       someDouble: someDouble,
  ///     );
  ///   },
  /// )
  /// ```
  ClampedDouble({
    this.lowerLimit = double.negativeInfinity,
    this.upperLimit = double.infinity,
    required double value,
  }) {
    assert(
        upperLimit >= lowerLimit,
        'upperLimit ($upperLimit) must be greater than or equal to lowerLimit'
        '($lowerLimit).');

    this.value = value;
  }

  final double lowerLimit;
  final double upperLimit;
  late double _value;

  double get value => _value;

  set value(double value) {
    _value = value.clamp(lowerLimit, upperLimit);
  }
}
