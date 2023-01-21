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
import 'widget_test_session_area_theme.dart';
import 'zoom_controls_theme.dart';

class ManualWidgetTesterThemeData extends Equatable {
  /// The tab theme.
  final ManualWidgetTesterTabTheme tabTheme;

  /// The button theme.
  final ManualWidgetTesterButtonTheme buttonTheme;

  /// The text field theme.
  final ManualWidgetTesterTextFieldTheme textFieldTheme;

  /// The theme of the zoom controls.
  final ManualWidgetTesterZoomControlsTheme zoomControlsTheme;

  /// The foldable region theme.
  final ManualWidgetTesterFoldableRegionTheme foldableRegionTheme;

  /// The theme of the “create test session” dialog
  final ManualWidgetTesterCreateTestSessionDialogTheme
      createTestSessionDialogTheme;

  /// The test session menu item theme.
  final ManualWidgetTesterTestSessionMenuItemTheme testSessionMenuItemTheme;

  /// The edit color button theme.
  final ManualWidgetTesterEditColorButtonTheme editColorButtonTheme;

  /// The dialog theme.
  final ManualWidgetTesterDialogTheme dialogTheme;

  /// The double editor theme.
  final ManualWidgetTesterDoubleEditor doubleEditorTheme;

  /// The boolean editor theme.
  final ManualWidgetTesterBoolEditorTheme boolEditorTheme;

  /// The custom settings heading theme.
  final ManualWidgetTesterCustomSettingHeadingTheme customSettingsHeadingTheme;

  /// The theme of the drag handle.
  final ManualWidgetTesterDragHandleTheme dragHandleTheme;

  /// The theme of the message that is displayed when a test session has no
  /// custom settings.
  final ManualWidgetTesterNoCustomSettingsMessageTheme
      noCustomSettingsMessageTheme;

  /// The radio button theme.
  final ManualWidgetTesterRadioButtonTheme radioButtonTheme;

  /// The close button theme.
  final ManualWidgetTesterCloseButtonTheme closeButtonTheme;

  /// The theme of the message that is displayed when no editor for a particular
  /// setting could be built.
  final ManualWidgetTesterNoEditorMessageTheme noEditorMessageTheme;

  /// The theme of the app bar.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test
  /// session” button.
  final ManualWidgetTesterAppBarTheme appBarTheme;

  /// The string editor theme.
  final ManualWidgetTesterStringEditorTheme stringEditorTheme;

  /// The theme of the “create test session” button.
  final ManualWidgetTesterCreateTestSessionButton createTestSessionButtonTheme;

  /// The icon theme.
  final ManualWidgetTesterIconTheme iconTheme;

  /// The custom settings theme.
  final ManualWidgetTesterCustomSettingsTheme customSettingsTheme;

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
    this.buttonTheme = const ManualWidgetTesterButtonTheme(),
    this.textFieldTheme = const ManualWidgetTesterTextFieldTheme(),
    this.zoomControlsTheme = const ManualWidgetTesterZoomControlsTheme(),
    this.foldableRegionTheme = const ManualWidgetTesterFoldableRegionTheme(),
    this.createTestSessionDialogTheme =
        const ManualWidgetTesterCreateTestSessionDialogTheme(),
    this.testSessionMenuItemTheme =
        const ManualWidgetTesterTestSessionMenuItemTheme(),
    this.editColorButtonTheme = const ManualWidgetTesterEditColorButtonTheme(),
    this.dialogTheme = const ManualWidgetTesterDialogTheme(),
    this.doubleEditorTheme = const ManualWidgetTesterDoubleEditor(),
    this.boolEditorTheme = const ManualWidgetTesterBoolEditorTheme(),
    this.customSettingsHeadingTheme =
        const ManualWidgetTesterCustomSettingHeadingTheme(),
    this.dragHandleTheme = const ManualWidgetTesterDragHandleTheme(),
    this.noCustomSettingsMessageTheme =
        const ManualWidgetTesterNoCustomSettingsMessageTheme(),
    this.radioButtonTheme = const ManualWidgetTesterRadioButtonTheme(),
    this.closeButtonTheme = const ManualWidgetTesterCloseButtonTheme(),
    this.noEditorMessageTheme = const ManualWidgetTesterNoEditorMessageTheme(),
    this.appBarTheme = const ManualWidgetTesterAppBarTheme(),
    this.stringEditorTheme = const ManualWidgetTesterStringEditorTheme(),
    this.createTestSessionButtonTheme =
        const ManualWidgetTesterCreateTestSessionButton(),
    this.iconTheme = const ManualWidgetTesterIconTheme(),
    this.customSettingsTheme = const ManualWidgetTesterCustomSettingsTheme(),
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
        customSettingsHeadingTheme,
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
}
