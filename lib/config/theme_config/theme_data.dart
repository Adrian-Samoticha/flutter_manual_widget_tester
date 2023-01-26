import 'package:equatable/equatable.dart';

import 'app_bar_theme.dart';
import 'bool_editor_theme.dart';
import 'button_theme.dart';
import 'close_button_theme.dart';
import 'create_test_session_button_theme.dart';
import 'create_test_session_dialog_theme.dart';
import 'custom_setting_heading_theme.dart';
import 'custom_settings_theme.dart';
import 'dialog_theme.dart';
import 'double_editor_theme.dart';
import 'drag_handle_theme.dart';
import 'edit_color_button_theme.dart';
import 'edit_color_dialog_theme.dart';
import 'foldable_region_theme.dart';
import 'general_theme.dart';
import 'icon_theme.dart';
import 'no_custom_settings_message_theme.dart';
import 'no_editor_message_theme.dart';
import 'radio_button_theme.dart';
import 'string_editor_theme.dart';
import 'tab_theme.dart';
import 'test_session_menu_item_theme.dart';
import 'text_field_theme.dart';
import 'theme_generator/theme_generator_parameters.dart';
import 'widget_test_session_area_theme.dart';
import 'zoom_controls_theme.dart';

class ManualWidgetTesterThemeData extends Equatable {
  /// The tab theme.
  final ManualWidgetTesterTabTheme tabTheme;

  /// The button theme.
  final ButtonTheme buttonTheme;

  /// The text field theme.
  final TextFieldTheme textFieldTheme;

  /// The theme of the zoom controls.
  final ManualWidgetTesterZoomControlsTheme zoomControlsTheme;

  /// The foldable region theme.
  final ManualWidgetTesterFoldableRegionTheme foldableRegionTheme;

  /// The theme of the “create test session” dialog
  final CreateTestSessionDialogTheme createTestSessionDialogTheme;

  /// The test session menu item theme.
  final ManualWidgetTesterTestSessionMenuItemTheme testSessionMenuItemTheme;

  /// The edit color button theme.
  final ManualWidgetTesterEditColorButtonTheme editColorButtonTheme;

  /// The dialog theme.
  final DialogTheme dialogTheme;

  /// The double editor theme.
  final ManualWidgetTesterDoubleEditorTheme doubleEditorTheme;

  /// The boolean editor theme.
  final BoolEditorTheme boolEditorTheme;

  /// The custom settings heading theme.
  final CustomSettingHeadingTheme customSettingHeadingTheme;

  /// The theme of the drag handle.
  final ManualWidgetTesterDragHandleTheme dragHandleTheme;

  /// The theme of the message that is displayed when a test session has no
  /// custom settings.
  final ManualWidgetTesterNoCustomSettingsMessageTheme
      noCustomSettingsMessageTheme;

  /// The radio button theme.
  final ManualWidgetTesterRadioButtonTheme radioButtonTheme;

  /// The close button theme.
  final CloseButtonTheme closeButtonTheme;

  /// The theme of the message that is displayed when no editor for a particular
  /// setting could be built.
  final ManualWidgetTesterNoEditorMessageTheme noEditorMessageTheme;

  /// The theme of the app bar.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test
  /// session” button.
  final AppBarTheme appBarTheme;

  /// The string editor theme.
  final ManualWidgetTesterStringEditorTheme stringEditorTheme;

  /// The theme of the “create test session” button.
  final CreateTestSessionButtonTheme createTestSessionButtonTheme;

  /// The icon theme.
  final ManualWidgetTesterIconTheme iconTheme;

  /// The custom settings theme.
  final CustomSettingsTheme customSettingsTheme;

  /// The widget test session area theme.
  final ManualWidgetTesterWidgetTestSessionAreaTheme widgetTestSessionAreaTheme;

  /// The “general” theme.
  ///
  /// This theme contains miscellaneous properties that do not fit into the
  /// other themes.
  final ManualWidgetTesterGeneralTheme generalTheme;

  /// The theme of the “edit color” dialog.
  final ManualWidgetTesterEditColorDialogTheme editColorDialogTheme;

  const ManualWidgetTesterThemeData({
    this.tabTheme = const ManualWidgetTesterTabTheme(),
    this.buttonTheme = const ButtonTheme(),
    this.textFieldTheme = const TextFieldTheme(),
    this.zoomControlsTheme = const ManualWidgetTesterZoomControlsTheme(),
    this.foldableRegionTheme = const ManualWidgetTesterFoldableRegionTheme(),
    this.createTestSessionDialogTheme = const CreateTestSessionDialogTheme(),
    this.testSessionMenuItemTheme =
        const ManualWidgetTesterTestSessionMenuItemTheme(),
    this.editColorButtonTheme = const ManualWidgetTesterEditColorButtonTheme(),
    this.dialogTheme = const DialogTheme(),
    this.doubleEditorTheme = const ManualWidgetTesterDoubleEditorTheme(),
    this.boolEditorTheme = const BoolEditorTheme(),
    this.customSettingHeadingTheme = const CustomSettingHeadingTheme(),
    this.dragHandleTheme = const ManualWidgetTesterDragHandleTheme(),
    this.noCustomSettingsMessageTheme =
        const ManualWidgetTesterNoCustomSettingsMessageTheme(),
    this.radioButtonTheme = const ManualWidgetTesterRadioButtonTheme(),
    this.closeButtonTheme = const CloseButtonTheme(),
    this.noEditorMessageTheme = const ManualWidgetTesterNoEditorMessageTheme(),
    this.appBarTheme = const AppBarTheme(),
    this.stringEditorTheme = const ManualWidgetTesterStringEditorTheme(),
    this.createTestSessionButtonTheme = const CreateTestSessionButtonTheme(),
    this.iconTheme = const ManualWidgetTesterIconTheme(),
    this.customSettingsTheme = const CustomSettingsTheme(),
    this.widgetTestSessionAreaTheme =
        const ManualWidgetTesterWidgetTestSessionAreaTheme(),
    this.generalTheme = const ManualWidgetTesterGeneralTheme(),
    this.editColorDialogTheme = const ManualWidgetTesterEditColorDialogTheme(),
  });

  @override
  List<Object?> get props => [
        tabTheme,
        buttonTheme,
        textFieldTheme,
        zoomControlsTheme,
        foldableRegionTheme,
        createTestSessionDialogTheme,
        testSessionMenuItemTheme,
        editColorButtonTheme,
        dialogTheme,
        doubleEditorTheme,
        boolEditorTheme,
        customSettingHeadingTheme,
        dragHandleTheme,
        noCustomSettingsMessageTheme,
        radioButtonTheme,
        closeButtonTheme,
        noEditorMessageTheme,
        appBarTheme,
        stringEditorTheme,
        createTestSessionButtonTheme,
        iconTheme,
        customSettingsTheme,
        widgetTestSessionAreaTheme,
        generalTheme,
        editColorDialogTheme,
      ];

  static ManualWidgetTesterThemeData fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterThemeData(
      tabTheme:
          ManualWidgetTesterTabTheme.fromThemeGeneratorParameters(parameters),
      buttonTheme: ButtonTheme.fromThemeGeneratorParameters(parameters),
      textFieldTheme: TextFieldTheme.fromThemeGeneratorParameters(parameters),
      zoomControlsTheme:
          ManualWidgetTesterZoomControlsTheme.fromThemeGeneratorParameters(
              parameters),
      foldableRegionTheme:
          ManualWidgetTesterFoldableRegionTheme.fromThemeGeneratorParameters(
              parameters),
      createTestSessionDialogTheme:
          CreateTestSessionDialogTheme.fromThemeGeneratorParameters(parameters),
      testSessionMenuItemTheme: ManualWidgetTesterTestSessionMenuItemTheme
          .fromThemeGeneratorParameters(parameters),
      editColorButtonTheme:
          ManualWidgetTesterEditColorButtonTheme.fromThemeGeneratorParameters(
              parameters),
      dialogTheme: DialogTheme.fromThemeGeneratorParameters(parameters),
      doubleEditorTheme:
          ManualWidgetTesterDoubleEditorTheme.fromThemeGeneratorParameters(
              parameters),
      boolEditorTheme: BoolEditorTheme.fromThemeGeneratorParameters(parameters),
      customSettingHeadingTheme:
          CustomSettingHeadingTheme.fromThemeGeneratorParameters(parameters),
      dragHandleTheme:
          ManualWidgetTesterDragHandleTheme.fromThemeGeneratorParameters(
              parameters),
      noCustomSettingsMessageTheme:
          ManualWidgetTesterNoCustomSettingsMessageTheme
              .fromThemeGeneratorParameters(parameters),
      radioButtonTheme:
          ManualWidgetTesterRadioButtonTheme.fromThemeGeneratorParameters(
              parameters),
      closeButtonTheme:
          CloseButtonTheme.fromThemeGeneratorParameters(parameters),
      noEditorMessageTheme:
          ManualWidgetTesterNoEditorMessageTheme.fromThemeGeneratorParameters(
              parameters),
      appBarTheme: AppBarTheme.fromThemeGeneratorParameters(parameters),
      stringEditorTheme:
          ManualWidgetTesterStringEditorTheme.fromThemeGeneratorParameters(
              parameters),
      createTestSessionButtonTheme:
          CreateTestSessionButtonTheme.fromThemeGeneratorParameters(parameters),
      iconTheme:
          ManualWidgetTesterIconTheme.fromThemeGeneratorParameters(parameters),
      customSettingsTheme:
          CustomSettingsTheme.fromThemeGeneratorParameters(parameters),
      widgetTestSessionAreaTheme: ManualWidgetTesterWidgetTestSessionAreaTheme
          .fromThemeGeneratorParameters(parameters),
      generalTheme: ManualWidgetTesterGeneralTheme.fromThemeGeneratorParameters(
          parameters),
      editColorDialogTheme:
          ManualWidgetTesterEditColorDialogTheme.fromThemeGeneratorParameters(
              parameters),
    );
  }
}
