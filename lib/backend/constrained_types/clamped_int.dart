class ClampedInt {
  /// Creates a [ClampedInt] whose [value] is guaranteed to be clamped to be
  /// in the range [lowerLimit]-[upperLimit].
  ///
  /// Both [lowerLimit] and [upperLimit] may be `null`, in which case the limit
  /// will not be enforced.
  ///
  /// It is intended to be used in conjunction with
  /// [WidgetTestSessionCustomSettings.getSetting] to create a custom setting
  /// whose value is a clamped integer.
  ///
  /// Usage example:
  /// ```dart
  /// WidgetTestBuilder(
  ///   id: 'my widget',
  ///   name: 'MyWidget',
  ///   builder: (context, settings) {
  ///     final someInt = settings
  ///         .getSetting('someInt',
  ///             ClampedInt(lowerLimit: -1, value: 0, upperLimit: 1))
  ///         .value;
  ///
  ///     return MyWidget(
  ///       someInt: someInt,
  ///     );
  ///   },
  /// )
  /// ```
  ClampedInt({this.lowerLimit, this.upperLimit, required int value}) {
    assert(
        lowerLimit == null || upperLimit == null || upperLimit! >= lowerLimit!,
        'upperLimit ($upperLimit) must be greater than or equal to lowerLimit'
        '($lowerLimit).');

    this.value = value;
  }

  final int? lowerLimit;
  final int? upperLimit;
  late int _value;

  int get value => _value;

  set value(int value) {
    final theoreticalLowerLimit = lowerLimit ?? value;
    final theoreticalUpperLimit = upperLimit ?? value;

    _value = value.clamp(theoreticalLowerLimit, theoreticalUpperLimit);
  }
}
