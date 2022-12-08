class ConstrainedInt {
  final int? lowerLimit;
  final int? upperLimit;
  final int divisor;
  late int _value;

  int get value => _value;

  bool _isDivisible(int number, int divisor) => (number % divisor) == 0;

  set value(int value) {
    final theoreticalLowerLimit = lowerLimit ?? value;
    final theoreticalUpperLimit = upperLimit ?? value;

    _value =
        (value.clamp(theoreticalLowerLimit, theoreticalUpperLimit) ~/ divisor) *
            divisor;
  }

  /// Creates a [ConstrainedInt] whose [value] is guaranteed to be clamped to be
  /// in the range [lowerLimit]-[upperLimit] and divisible by [divisor].
  ///
  /// Both [lowerLimit] and [upperLimit] may be `null`, in which case the limit
  /// will not be enforced.
  ///
  /// It is intended to be used in conjunction with
  /// [WidgetTestSessionCustomSettings.getSetting] to create a custom setting
  /// whose value is a constrained integer.
  ///
  /// Usage example:
  /// ```dart
  /// WidgetTestBuilder(
  ///   id: 'my widget',
  ///   name: 'MyWidget',
  ///   builder: (context, settings) {
  ///     final someInt = settings
  ///         .getSetting('someInt',
  ///             ConstrainedInt(
  ///                 lowerLimit: -10, value: 0, upperLimit: 10, divisor: 2))
  ///         .value;
  ///
  ///     return MyWidget(
  ///       someInt: someInt,
  ///     );
  ///   },
  /// )
  /// ```
  ConstrainedInt(
      {this.lowerLimit,
      this.upperLimit,
      this.divisor = 1,
      required int value}) {
    assert(
        lowerLimit == null || upperLimit == null || upperLimit! >= lowerLimit!,
        'upperLimit ($upperLimit) must be greater than or equal to lowerLimit'
        '($lowerLimit).');

    assert(lowerLimit == null || _isDivisible(lowerLimit!, divisor),
        'lowerLimit ($lowerLimit) must be divisible by divisor ($divisor).');

    assert(upperLimit == null || _isDivisible(upperLimit!, divisor),
        'upperLimit ($upperLimit) must be divisible by divisor ($divisor).');

    this.value = value;
  }
}
