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
    _value = value;
  }
}
