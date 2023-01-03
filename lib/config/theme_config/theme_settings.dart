import 'package:flutter/material.dart';

import 'bool_editor_theme.dart';
import 'button_theme.dart';
import 'close_button_theme.dart';
import 'create_test_session_dialog_theme.dart';
import 'custom_setting_heading_theme.dart';
import 'dialog_theme.dart';
import 'double_editor_theme.dart';
import 'drag_handle_theme.dart';
import 'edit_color_button_theme.dart';
import 'foldable_region_theme.dart';
import 'no_custom_settings_message_theme.dart';
import 'no_editor_message_theme.dart';
import 'radio_button_theme.dart';
import 'tab_theme.dart';
import 'test_session_menu_item_theme.dart';
import 'text_field_theme.dart';
import 'zoom_controls_theme.dart';

class ManualWidgetTesterThemeSettings {
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

  /// Whether this is a dark theme.
  final bool isDark;

  /// The color of the manual widget tester's background.
  final Color backgroundColor;

  /// The color of the manual widget tester's sidebar.
  final Color sidebarColor;

  /// The height of the app bar on the top of the widget.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test
  /// session” button.
  final double appBarHeight;

  /// The accent color, currently used only for the decoration of the focused
  /// tab.
  final Color accentColor;

  /// The color of the dotted lines that show the tested widget's size.
  final Color dottedLineColor;

  /// The text style in which the tested widget's size is displayed.
  final TextStyle widgetSizeTextStyle;

  /// The default color of the icons of the open test sessions.
  final Color defaultIconColor;

  /// The space between text boxes and connected button rows.
  final double spaceBetweenTextBoxesAndButtonRows;

  /// The padding of a custom settings widget.
  final EdgeInsets customSettingsPadding;

  /// The height of the string editor.
  final double stringEditorHeight;

  /// The default width of the number edit button row.
  ///
  /// The width gets reduced if the sidebar is too narrow.
  final double defaultNumberEditorButtonRowWidth;

  /// The padding of the “create test session” button.
  final EdgeInsets createTestSessionButtonPadding;

  /// The height of the container that simulates the shadow at the bottom of
  /// the app bar.
  final double appBarShadowHeight;

  /// The box decoration of the container that simulates the shadow at the
  /// bottom of the app bar.
  final BoxDecoration appBarShadowBoxDecoration;

  /// The duration of the scroll animation that plays when a widget is moved
  /// into view.
  final Duration scrollIntoViewDuration;

  const ManualWidgetTesterThemeSettings({
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
    this.isDark = true,
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.appBarHeight = 40.0,
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.widgetSizeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      fontSize: 10.0,
    ),
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
    this.spaceBetweenTextBoxesAndButtonRows = 0.5,
    this.customSettingsPadding = const EdgeInsets.all(8.0),
    this.stringEditorHeight = 32.0,
    this.defaultNumberEditorButtonRowWidth = 64.0,
    this.createTestSessionButtonPadding = const EdgeInsets.all(6.5),
    this.appBarShadowHeight = 16.0,
    this.appBarShadowBoxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(0, 0, 0, 0.15),
          Colors.transparent,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    this.scrollIntoViewDuration = const Duration(milliseconds: 250),
  });
}
