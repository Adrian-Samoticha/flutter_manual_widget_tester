import 'package:equatable/equatable.dart';

import 'theme_generator/theme_generator_parameters.dart';

class StringEditorTheme extends Equatable {
  const StringEditorTheme({
    this.height = 32.0,
  });

  /// The height of the string editor.
  final double height;

  @override
  List<Object?> get props => [
        height,
      ];

  static StringEditorTheme fromThemeGeneratorParameters(
    ThemeGeneratorParameters parameters,
  ) {
    return StringEditorTheme(
      height: _getHeight(parameters),
    );
  }

  static double _getHeight(ThemeGeneratorParameters parameters) {
    final layout = parameters.layout;

    switch (layout) {
      case Layout.compact:
        return 24.0;
      case Layout.normal:
        return 32.0;
      case Layout.cozy:
        return 48.0;
    }
  }
}
