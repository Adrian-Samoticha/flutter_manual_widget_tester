import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'create_test_session_dialog_theme.dart';
import 'dialog_theme.dart';
import 'edit_color_button_theme.dart';
import 'foldable_region_theme.dart';
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

  /// The box decoration of a close button's hover effect.
  final BoxDecoration closeButtonHoverDecoration;

  /// The close button's color.
  final Color closeButtonColor;

  /// The padding of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets noEditorMessagePadding;

  /// The margin of the message that is displayed when no editor for a
  /// particular setting could be built.
  final EdgeInsets noEditorMessageMargin;

  /// The box decoration of the message that is displayed when no editor for a
  /// particular setting could be built.
  final BoxDecoration noEditorMessageDecoration;

  /// The padding of the message that is displayed when a test session has no
  /// custom settings.
  final EdgeInsets noCustomSettingsMessagePadding;

  /// The text style of the message that is displayed when a test session has
  /// no custom settings.
  final TextStyle noCustomSettingsMessageTextStyle;

  /// The text style of the message that is displayed when no editor for a
  /// particular setting could be built.
  final TextStyle noEditorTextStyle;

  /// The text style of the highlighted text of the message that is displayed
  /// when no editor for a particular setting could be built.
  final TextStyle noEditorHighlightedTextStyle;

  /// The text style of a custom setting's heading.
  final TextStyle customSettingHeadingTextStyle;

  /// The text overflow behavior of a custom setting's heading.
  final TextOverflow customSettingHeadingOverflow;

  /// The padding of a custom setting's heading.
  final EdgeInsets customSettingsHeadingPadding;

  /// The padding of a custom settings widget.
  final EdgeInsets customSettingsPadding;

  /// The height of the string editor.
  final double stringEditorHeight;

  /// The default width of the number edit button row.
  ///
  /// The width gets reduced if the sidebar is too narrow.
  final double defaultNumberEditorButtonRowWidth;

  /// The space between the text field and the double editor's infinite scroll
  /// view.
  final double spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView;

  /// The height of the double editor's infinite scroll view.
  final double doubleEditorInfiniteScrollViewHeight;

  /// The double editor's infinite scroll view's box decoration.
  final BoxDecoration doubleEditorInfiniteScrollViewBoxDecoration;

  /// The double editor's infinite scroll view's padding.
  final EdgeInsets doubleEditorInfiniteScrollViewPadding;

  /// The text style of the double editor's infinite scroll view.
  final TextStyle doubleEditorInfiniteScrollViewTextStyle;

  /// The double editor's infinite scroll view's padding amount.
  final double doubleEditorInfiniteScrollViewTextPaddingAmount;

  /// The color of the lines in the double editor's infinite scroll view.
  final Color doubleEditorInfiniteScrollViewLineColor;

  /// The width of the lines in the double editor's infinite scroll view.
  final double doubleEditorInfiniteScrollViewLineWidth;

  /// The color of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final Color doubleEditorInfiniteScrollViewIndicatorColor;

  /// The width of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double doubleEditorInfiniteScrollViewIndicatorWidth;

  /// The height of the indicator in the double editor's infinite scroll view
  /// (on a range from 0.0 to 1.0).
  ///
  /// The indicator is the line in the middle of the infinite scroll view that
  /// shows where the currently selected double value is located.
  final double doubleEditorInfiniteScrollViewIndicatorHeight;

  /// The widget to use as the selected radio button.
  final Widget selectedRadioButton;

  /// The widget to use as the unselected radio button.
  final Widget unselectedRadioButton;

  /// The space between a radio button and its label.
  final double spaceBetweenRadioButtonAndLabel;

  /// The text style of a selected radio buttons label.
  final TextStyle selectedRadioButtonLabelStyle;

  /// The text style of an unselected radio buttons label.
  final TextStyle unselectedRadioButtonLabelStyle;

  /// The maximal width of a boolean editor.
  final double boolEditorMaxWidth;

  /// The space between the radio buttons in the boolean editor.
  final double boolEditorSpaceBetweenRadioButtons;

  /// The boolean editor's padding.
  final EdgeInsets boolEditorRadioButtonPadding;

  /// The height of the boolean editor.
  final double boolEditorHeight;

  /// The padding of the “create test session” button.
  final EdgeInsets createTestSessionButtonPadding;

  /// The color of the drag handle that appears when the sidebar is being
  /// resized.
  final Color dragHandleColor;

  /// The size of the drag handle that appears when the sidebar is being
  /// resized.
  final double dragHandleSize;

  /// The duration of the drag handle's fade animation.
  ///
  /// The “drag handle” refers to the line that appears when the sidebar is
  /// being resized.
  final Duration dragHandleChangeOpacityDuration;

  /// The amount of time until the drag handle appears when sidebar's edge is
  /// being hovered over.
  final Duration timeUntilDragHandleAppears;

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
    this.closeButtonHoverDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(1024.0)),
    ),
    this.closeButtonColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.noEditorMessagePadding = const EdgeInsets.all(8.0),
    this.noEditorMessageMargin = const EdgeInsets.all(8.0),
    this.noEditorMessageDecoration = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 128, 0, 1.0),
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.noCustomSettingsMessagePadding = const EdgeInsets.all(8.0),
    this.noCustomSettingsMessageTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.75),
    ),
    this.noEditorTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 128, 0, 1.0),
    ),
    this.noEditorHighlightedTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 192, 0, 1.0),
      fontStyle: FontStyle.italic,
    ),
    this.customSettingHeadingTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.customSettingHeadingOverflow = TextOverflow.ellipsis,
    this.customSettingsHeadingPadding = const EdgeInsets.only(bottom: 5.0),
    this.customSettingsPadding = const EdgeInsets.all(8.0),
    this.stringEditorHeight = 32.0,
    this.defaultNumberEditorButtonRowWidth = 64.0,
    this.spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView = 4.0,
    this.doubleEditorInfiniteScrollViewHeight = 32.0,
    this.doubleEditorInfiniteScrollViewBoxDecoration = const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: [
        BoxShadow(color: Color.fromRGBO(18, 20, 23, 1.0)),
        BoxShadow(
          color: Color.fromRGBO(43, 47, 54, 1.0),
          spreadRadius: -2.0,
          blurRadius: 5.5,
          offset: Offset(0.0, 1.0),
        ),
      ],
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.075),
        ),
      ),
    ),
    this.doubleEditorInfiniteScrollViewPadding =
        const EdgeInsets.symmetric(vertical: 2.0),
    this.doubleEditorInfiniteScrollViewTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.doubleEditorInfiniteScrollViewTextPaddingAmount = 4.0,
    this.doubleEditorInfiniteScrollViewLineColor =
        const Color.fromRGBO(255, 255, 255, 1.0),
    this.doubleEditorInfiniteScrollViewLineWidth = 1.1,
    this.doubleEditorInfiniteScrollViewIndicatorColor =
        const Color.fromRGBO(32, 145, 255, 1.0),
    this.doubleEditorInfiniteScrollViewIndicatorWidth = 2.31,
    this.doubleEditorInfiniteScrollViewIndicatorHeight = 0.75,
    this.selectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(64, 64, 64, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(150, 150, 150, 1.0),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            blurRadius: 2.0,
            offset: Offset(0.5, 1.0),
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.67,
        heightFactor: 0.67,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(24, 125, 192, 1.0)),
              BoxShadow(
                color: Color.fromRGBO(32, 175, 255, 1.0),
                spreadRadius: -2.0,
                blurRadius: 2.5,
                offset: Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: FractionallySizedBox(
            widthFactor: 0.24,
            heightFactor: 0.24,
            alignment: Alignment(-0.35, -0.35),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.3),
                    Color.fromRGBO(255, 255, 255, 0.25),
                    Color.fromRGBO(255, 255, 255, 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    this.unselectedRadioButton = const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(52, 52, 52, 1.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromRGBO(82, 82, 82, 1.0),
          ),
        ),
      ),
    ),
    this.spaceBetweenRadioButtonAndLabel = 12.0,
    this.selectedRadioButtonLabelStyle = const TextStyle(
      color: Colors.white,
    ),
    this.unselectedRadioButtonLabelStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    this.boolEditorMaxWidth = 192.0,
    this.boolEditorSpaceBetweenRadioButtons = 12.0,
    this.boolEditorRadioButtonPadding =
        const EdgeInsets.symmetric(vertical: 8.0),
    this.boolEditorHeight = 16.0,
    this.createTestSessionButtonPadding = const EdgeInsets.all(6.5),
    this.dragHandleColor = Colors.blue,
    this.dragHandleSize = 6.0,
    this.dragHandleChangeOpacityDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
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
