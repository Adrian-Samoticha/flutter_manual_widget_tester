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
    return const StringEditorTheme();
  }
}
