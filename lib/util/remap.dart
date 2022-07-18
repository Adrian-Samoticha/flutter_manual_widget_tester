extension Remap on num {
  double remap(num inMin, num inMax, num outMin, num outMax) {
    return (this - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }
}