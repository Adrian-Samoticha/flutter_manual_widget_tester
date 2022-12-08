class ClampedDouble {
  final double lowerLimit;
  final double upperLimit;
  late double _value;

  double get value => _value;

  set value(double value) {
    _value = value.clamp(lowerLimit, upperLimit);
  }

  ClampedDouble(
      {this.lowerLimit = double.negativeInfinity,
      this.upperLimit = double.infinity,
      required value}) {
    assert(upperLimit >= lowerLimit,
        'upperLimit ($upperLimit) must be greater than or equal to lowerLimit ($lowerLimit).');

    this.value = value;
  }
}
