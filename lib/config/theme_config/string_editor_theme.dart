import 'package:equatable/equatable.dart';

import 'theme_generator/theme_generator_parameters.dart';

class StringEditorTheme extends Equatable {
  /// The height of the string editor.
  final double height;

  const StringEditorTheme({
    this.height = 32.0,
  });

  @override
  List<Object?> get props => [
        height,
      ];

  static StringEditorTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const StringEditorTheme();
  }
}
