import 'package:equatable/equatable.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterStringEditorTheme extends Equatable {
  /// The height of the string editor.
  final double stringEditorHeight;

  const ManualWidgetTesterStringEditorTheme({
    this.stringEditorHeight = 32.0,
  });

  @override
  List<Object?> get props => [
        stringEditorHeight,
      ];

  static ManualWidgetTesterStringEditorTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return const ManualWidgetTesterStringEditorTheme();
  }
}
