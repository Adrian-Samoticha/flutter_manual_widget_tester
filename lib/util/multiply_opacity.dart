import 'dart:ui';

extension MultiplyOpacity on Color {
  Color multiplyOpacity(double opacity) {
    final originalOpacity = this.opacity;
    return withOpacity(originalOpacity * opacity);
  }
}
