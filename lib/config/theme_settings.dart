import 'package:flutter/material.dart';

class ManualWidgetTesterThemeSettings {
  /// The color of the manual widget tester's background.
  final Color backgroundColor;

  /// The color of the manual widget tester's sidebar.
  final Color sidebarColor;

  /// The height of the app bar on the top of the widget.
  ///
  /// The app bar is the bar that houses the tab bar and the “create new test session” button.
  final double appBarHeight;

  /// The accent color, currently used only for the decoration of the selected tab.
  final Color accentColor;

  /// The minimal tab width.
  ///
  /// **Note:** The tabs will resize themselves based on the current window size.
  final double minTabWidth;

  /// The maximal tab width.
  ///
  /// **Note:** The tabs will resize themselves based on the current window size.
  final double maxTabWidth;

  /// The color of the dotted lines that show the tested widget's size.
  final Color dottedLineColor;

  /// The text style in which the tested widget's size is displayed.
  final TextStyle widgetSizeTextStyle;

  /// The default color of the icons of the open test sessions.
  final Color defaultIconColor;

  /// The buttons' color.
  final Color buttonColor;

  /// The buttons' border radius.
  final Radius buttonBorderRadius;

  /// The buttons' shadow(s).
  final List<BoxShadow> buttonShadow;

  /// The color to tint the button with when it is pressed.
  final Color buttonPressedTint;

  /// The color to tint the button with when it is hovered over.
  final Color buttonHoveredTint;

  /// The offset of the button when it is pressed.
  final Offset buttonPressedOffset;

  /// The color of the line that separates two buttons within a button row.
  final Color buttonSeparatorColor;

  /// The width of the line that separates two buttons within a button row.
  final double buttonSeparatorWidth;

  /// The icon theme of a disabled button.
  final IconThemeData disabledButtonIconTheme;

  /// The icon theme of a pressed button.
  final IconThemeData pressedButtonIconTheme;

  /// The icon theme of an enabled, unpressed button.
  final IconThemeData buttonIconTheme;

  /// The text style of a disabled button.
  final TextStyle disabledButtonTextStyle;

  /// The text style of a pressed button.
  final TextStyle pressedButtonTextStyle;

  /// The text style of an enabled, unpressed button.
  final TextStyle buttonTextStyle;

  /// The shadow(s) of a text field.
  final List<BoxShadow> textFieldShadow;

  /// The border radius of a text field.
  final Radius textFieldBorderRadius;

  /// The color of a text field.
  final Color textFieldColor;

  /// The border color of a text field.
  final Color textFieldBorderColor;

  /// The border width of a text field.
  final double textFieldBorderWidth;

  /// The text style of a text field.
  final TextStyle textFieldTextStyle;

  /// The text style of a text field's suffix.
  final TextStyle textFieldSuffixStyle;

  /// The color of a text field's cursor.
  final Color textFieldCursorColor;

  /// The color of a text field's selection.
  final Color textFieldSelectionColor;

  /// The padding of a text field's content.
  final EdgeInsetsGeometry textFieldContentPadding;

  /// The width of the zoom controls.
  final double zoomControlsWidth;

  /// The height of the zoom controls.
  final double zoomControlsHeight;

  /// The border radius of the zoom controls.
  final BorderRadius zoomControlsBorderRadius;

  /// The shadow(s) of the zoom controls.
  final List<BoxShadow> zoomControlsShadow;

  /// The padding of the zoom controls.
  final EdgeInsets zoomControlsPadding;

  /// The space between text boxes and connected button rows.
  final double spaceBetweenTextBoxesAndButtonRows;

  /// The width of the zoom controls' button row.
  final double zoomControlsButtonRowWidth;

  /// The icon on the zoom controls' zoom out button.
  final Icon zoomControlsZoomOutIcon;

  /// The icon on the zoom controls' zoom in button.
  final Icon zoomControlsZoomInIcon;

  /// The zoom controls' distance to the manual widget tester's border.
  final double zoomControlsDistanceToBorder;

  /// The zoom controls' alignment.
  final Alignment zoomControlsAlignment;

  /// The indentation amount in foldable regions.
  final double foldableRegionIndentationAmount;

  /// The animation duration of foldable regions.
  final Duration foldableRegionAnimationDuration;

  /// The alignment of a foldable region's content during the fold/unfold animation.
  final Alignment foldableRegionContentAlignment;

  /// The height of a foldable region's header.
  final double foldableRegionHeaderHeight;

  /// The opacity of a foldable region's header when it is folded.
  final double foldableRegionFoldedHeaderOpacity;

  /// A foldable region's header color.
  final Color foldableRegionHeaderColor;

  /// The color of a foldable region's chevron icon.
  final Color foldableRegionChevronIconColor;

  /// The size of a foldable region's chevron icon.
  final double foldableRegionChevronIconSize;

  /// The text style of a foldable region's heading.
  final TextStyle foldableRegionHeadingStyle;

  /// The foldable region's header's overflow.
  final TextOverflow foldableRegionHeadingOverflow;

  /// The box decoration of a close button's hover effect.
  final BoxDecoration closeButtonHoverDecoration;

  /// The close button's color.
  final Color closeButtonColor;

  /// The height of a menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemHeight;

  /// The opacity of an unselected menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemUnselectedTabOpacity;

  /// The padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets testSessionMenuItemPadding;

  /// The padding of a menu item's close button in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets testSessionMenuItemCloseButtonPadding;

  /// The size of a menu item's close button in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemCloseButtonSize;

  /// The text overflow behavior of a menu item in the “RUNNING TEST SESSIONS” area.
  final TextOverflow testSessionMenuItemTextOverflow;

  /// The text style of a menu item in the “RUNNING TEST SESSIONS” area.
  final TextStyle testSessionMenuItemTextStyle;

  /// The icon size of a menu item in the “RUNNING TEST SESSIONS” area.
  final double testSessionMenuItemIconSize;

  /// The hover tint decoration of a menu item in the “RUNNING TEST SESSIONS” area.
  final BoxDecoration testSessionMenuItemHoverTintDecoration;

  /// The icon padding of a menu item in the “RUNNING TEST SESSIONS” area.
  final EdgeInsets testSessionMenuItemTabIconPadding;

  /// The tint decoration of a selected menu item in the “RUNNING TEST SESSIONS” area.
  final BoxDecoration testSessionMenuItemSelectedTabTintDecoration;

  /// The padding of the message that is displayed when no editor for a particular setting could be built.
  final EdgeInsets noEditorMessagePadding;

  /// The margin of the message that is displayed when no editor for a particular setting could be built.
  final EdgeInsets noEditorMessageMargin;

  /// The box decoration of the message that is displayed when no editor for a particular setting could be built.
  final BoxDecoration noEditorMessageDecoration;

  /// The padding of the message that is displayed when a test session has no custom settings.
  final EdgeInsets noCustomSettingsMessagePadding;

  /// The text style of the message that is displayed when a test session has no custom settings.
  final TextStyle noCustomSettingsMessageTextStyle;

  /// The text style of the message that is displayed when no editor for a particular setting could be built.
  final TextStyle noEditorTextStyle;

  /// The text style of the highlighted text of the message that is displayed when no editor for a particular setting could be built.
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

  /// A dialog's background color.
  final Color dialogBackgroundColor;

  /// The color of a dialog's barrier.
  final Color dialogBarrierColor;

  /// The duration of a dialog's open/close animation.
  final Duration dialogOpenCloseAnimationDuration;

  /// The animation curve of a dialog's open/close animation.
  final Curve dialogOpenCloseAnimationCurve;

  /// The offset of the dialog's open/close animation.
  final Offset dialogOpenCloseAnimationOffset;

  /// The alignment of a dialog box.
  final Alignment dialogAlignment;

  /// The blur radius of a dialog's backdrop effect.
  final double dialogBlurRadius;

  /// The border radius of a dialog box.
  final BorderRadius dialogBorderRadius;

  /// The border color of a dialog box.
  final Color dialogBorderColor;

  /// The shadow(s) of a dialog box.
  final List<BoxShadow> dialogShadow;

  /// The padding of a dialog box.
  final EdgeInsets dialogPadding;

  /// The height of the buttons in the dialog box's action button row.
  final double dialogActionButtonHeight;

  /// The background color of the section in which the dialog's action buttons are located.
  final Color dialogActionButtonSectionBackgroundColor;

  /// The base width of a dialog's action button row, upon which `customDialogActionButtonWidthAddition` gets added for each action button.
  final double baseDialogActionButtonRowWidth;

  /// The amount to add to the default action button row width for each action button.
  final double customDialogActionButtonWidthAddition;

  /// The distance between the dialog's content and its action button row.
  final double distanceBetweenDialogContentAndActionButtons;

  /// The height of the edit color button.
  final double editColorButtonHeight;

  /// The box decoration of the edit color button when it is displaying a dark color.
  final BoxDecoration editColorButtonDecorationForDarkColor;

  /// The box decoration of the edit color button when it is displaying a bright color.
  final BoxDecoration editColorButtonDecorationForBrightColor;

  /// The border radius of the edit color button.
  final BorderRadius editColorButtonBorderRadius;

  /// The first checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is displaying a transparent color.
  final Color editColorButtonCheckerboardColor1;

  /// The second checkerboard color of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is displaying a transparent color.
  final Color editColorButtonCheckerboardColor2;

  /// The checkerboard size of the edit color button.
  ///
  /// The checkerboard pattern is only shown when the edit color button is displaying a transparent color.
  final double editColorButtonCheckerboardSize;

  /// The icon on the edit color button.
  final IconData editColorButtonIcon;

  /// The color of the edit color button's icon when it is displaying a dark color.
  final Color editColorButtonIconColorForDarkColor;

  /// The color of the edit color button's icon when it is displaying a bright color.
  final Color editColorButtonIconColorForBrightColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a dark color.
  final List<Shadow>? editColorButtonIconShadowsForDarkColor;

  /// The shadow(s) of the edit color button's icon when it is displaying a bright color.
  final List<Shadow>? editColorButtonIconShadowsForBrightColor;

  /// The duration of the edit color button's icon's slide in/out animation that is played when the mouse is hovered over the button.
  final Duration editColorButtonIconAnimationDuration;

  /// The animation curve of the edit color button's icon's slide in/out animation that is played when the mouse is hovered over the button.
  final Curve editColorButtonIconAnimationCurve;

  /// The text style of the edit color button when it is displaying a dark color.
  final TextStyle editColorButtonTextStyleForDarkColor;

  /// The text style of the edit color button when it is displaying a bright color.
  final TextStyle editColorButtonTextStyleForBrightColor;

  /// The duration of the edit color dialog's size change animation.
  final Duration editColorDialogSizeChangeAnimationDuration;

  /// The animation curve of the edit color dialog's size change animation.
  final Curve editColorDialogSizeChangeCurve;

  /// The elevation of the edit color dialog.
  final double editColorDialogElevation;

  /// The border radius of the edit color dialog.
  final double editColorDialogBorderRadius;

  /// The text style of the edit color dialog's color name.
  final TextStyle editColorDialogColorNameTextStyle;

  /// The text style of the edit color dialog's picker type text.
  final TextStyle editColorDialogPickerTypeTextStyle;

  /// The color of the selected picker type text in the edit color dialog.
  final Color editColorDialogSelectedPickerTypeColor;

  /// The horizontal spacing between the color picker indicator items in the edit color dialog.
  final double editColorDialogSpacing;

  /// The space between the color picker color item rows in the edit color dialog, when they need to be wrapped to multiple rows.
  final double editColorDialogRunSpacing;

  /// Vertical spacing between items in the color picker column in the edit color dialog.
  final double editColorDialogColumnSpacing;

  /// The default width of the number edit button row.
  ///
  /// The width gets reduced if the sidebar is too narrow.
  final double defaultNumberEditorButtonRowWidth;

  /// The space between the text field and the double editor's infinite scroll view.
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
  /// The indicator is the line in the middle of the infinite scroll view that shows where the currently selected double value is located.
  final Color doubleEditorInfiniteScrollViewIndicatorColor;

  /// The width of the indicator in the double editor's infinite scroll view.
  ///
  /// The indicator is the line in the middle of the infinite scroll view that shows where the currently selected double value is located.
  final double doubleEditorInfiniteScrollViewIndicatorWidth;

  /// The height of the indicator in the double editor's infinite scroll view (on a range from 0.0 to 1.0).
  ///
  /// The indicator is the line in the middle of the infinite scroll view that shows where the currently selected double value is located.
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

  /// The width of the “create test session” button.
  final double createTestSessionDialogWidth;

  /// The padding of the “create test session” dialog.
  final EdgeInsets createTestSessionDialogPadding;

  /// The height factor of the “create test session” dialog's search result list in relation to the window's height.
  ///
  /// A height factor of 0.5 means that the search result list covers 50 % of the application window.
  final double createTestSessionDialogSearchResultsHeightFactor;

  /// The height of the “create test session” dialog's search bar.
  final double createTestSessionDialogSearchBarHeight;

  /// The padding of the “create test session” dialog's search results.
  final EdgeInsets createTestSessionDialogSearchResultsPadding;

  /// The height of a single item in the “create test session” dialog's search results.
  final double createTestSessionDialogSearchResultHeight;

  /// The box decoration of the “create test session” dialog's selected search result.
  final BoxDecoration createTestSessionDialogSelectedSearchResultDecoration;

  /// The box decoration of the “create test session” dialog's unselected search results.
  final BoxDecoration createTestSessionDialogUnselectedSearchResultDecoration;

  /// The text style of the “create test session” dialog's search results.
  final TextStyle createTestSessionDialogSearchResultTextStyle;

  /// The padding of the “create test session” dialog's search result icons.
  final EdgeInsets createTestSessionDialogSearchResultIconPadding;

  /// The size of the “create test session” dialog's search result icons.
  final double createTestSessionDialogSearchResultIconSize;

  /// The duration of the “create test session” dialog's search result fade animation.
  final Duration createTestSessionDialogSearchResultFadeDuration;

  /// The opacity of the “create test session” dialog's unselected search results.
  final double createTestSessionDialogUnselectedSearchResultOpacity;

  /// The text style of the “create test session” dialog's *“No matching results.”* text.
  final TextStyle createTestSessionDialogNoMatchingResultsTextStyle;

  /// The box decoration of the selected tab.
  final BoxDecoration selectedTabBoxDecoration;

  /// The box decoration of the unselected tabs.
  final BoxDecoration unselectedTabBoxDecoration;

  /// The width of the decoration of the selected tab.
  final double selectedTabAccentColorDecorationWidth;

  /// The width of the line that separates tabs.
  final BoxDecoration tabSeparatorBoxDecoration;

  /// The box decoration of the active tab's light reflection.
  final BoxDecoration tabLightReflectionBoxDecoration;

  /// The padding of the tabs' icons.
  final EdgeInsets tabIconPadding;

  /// The size of the tabs' icons.
  final double tabIconSize;

  /// The text style of the tabs' text.
  final TextStyle tabTextStyle;

  /// The opacity of unselected tabs that are being hovered over.
  final double unselectedHoveredTabOpacity;

  /// The opacity of unselected tabs that are *not* being hovered over.
  final double unselectedNotHoveredTabOpacity;

  /// The duration of the opacity change animation that plays when an unselected tab is hovered over.
  final Duration unselectedTabOpacityChangeDuration;

  /// The space above the tab bar.
  final double spaceAboveTabs;

  /// The padding of the tabs' content.
  final EdgeInsets tabContentPadding;

  /// The duration of the animation that plays when a new tab has been opened.
  final Duration tabOpenAnimationDuration;

  /// The animation curve of the animation that plays when a new tab has been opened.
  final Curve tabOpenAnimationCurve;

  /// The color of the drag handle that appears when the sidebar is being resized.
  final Color dragHandleColor;

  /// The size of the drag handle that appears when the sidebar is being resized.
  final double dragHandleSize;

  /// The duration of the drag handle's fade animation.
  ///
  /// The “drag handle” refers to the line that appears when the sidebar is being resized.
  final Duration dragHandleChangeOpacityDuration;

  /// The amount of time until the drag handle appears when sidebar's edge is being hovered over.
  final Duration timeUntilDragHandleAppears;

  const ManualWidgetTesterThemeSettings({
    this.backgroundColor = const Color.fromRGBO(41, 43, 53, 1.0),
    this.sidebarColor = const Color.fromRGBO(33, 37, 43, 1.0),
    this.appBarHeight = 40.0,
    this.accentColor = const Color.fromARGB(255, 40, 138, 251),
    this.minTabWidth = 64.0,
    this.maxTabWidth = 192.0,
    this.dottedLineColor = const Color.fromRGBO(255, 255, 255, 0.5),
    this.widgetSizeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      fontSize: 10.0,
    ),
    this.defaultIconColor = const Color.fromRGBO(64, 167, 255, 1.0),
    this.buttonColor = const Color.fromRGBO(45, 50, 59, 1.0),
    this.buttonBorderRadius = const Radius.circular(3.0),
    this.buttonShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.buttonPressedTint = const Color.fromRGBO(0, 0, 0, 0.1),
    this.buttonHoveredTint = const Color.fromRGBO(255, 255, 255, 0.05),
    this.buttonPressedOffset = const Offset(0.0, 0.5),
    this.buttonSeparatorColor = const Color.fromRGBO(0, 0, 0, 0.2),
    this.buttonSeparatorWidth = 1.2,
    this.disabledButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.25),
      size: 18.5,
    ),
    this.pressedButtonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      size: 18.5,
    ),
    this.buttonIconTheme = const IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      size: 18.5,
    ),
    this.disabledButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.25),
    ),
    this.pressedButtonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    this.buttonTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.textFieldShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.textFieldBorderRadius = const Radius.circular(3.0),
    this.textFieldColor = const Color.fromARGB(255, 41, 45, 53),
    this.textFieldBorderColor = const Color.fromRGBO(255, 255, 255, 0.05),
    this.textFieldBorderWidth = 1.0,
    this.textFieldTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldSuffixStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      fontSize: 13.0,
    ),
    this.textFieldCursorColor = const Color.fromRGBO(4, 180, 255, 1.0),
    this.textFieldSelectionColor = const Color.fromRGBO(4, 180, 255, 0.67),
    this.textFieldContentPadding = const EdgeInsets.all(8.0),
    this.zoomControlsWidth = 128.0,
    this.zoomControlsHeight = 32.0,
    this.zoomControlsBorderRadius = const BorderRadius.all(
      Radius.circular(3.0),
    ),
    this.zoomControlsShadow = const [
      BoxShadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.zoomControlsPadding = const EdgeInsets.all(3.5),
    this.spaceBetweenTextBoxesAndButtonRows = 0.5,
    this.zoomControlsButtonRowWidth = 64.0,
    this.zoomControlsZoomOutIcon = const Icon(Icons.zoom_out),
    this.zoomControlsZoomInIcon = const Icon(Icons.zoom_in),
    this.zoomControlsDistanceToBorder = 8.0,
    this.zoomControlsAlignment = Alignment.bottomCenter,
    this.foldableRegionIndentationAmount = 12.0,
    this.foldableRegionAnimationDuration = const Duration(milliseconds: 300),
    this.foldableRegionContentAlignment = Alignment.bottomLeft,
    this.foldableRegionHeaderHeight = 24.0,
    this.foldableRegionFoldedHeaderOpacity = 0.5,
    this.foldableRegionHeaderColor = const Color.fromRGBO(70, 79, 90, 1.0),
    this.foldableRegionChevronIconColor = Colors.white,
    this.foldableRegionChevronIconSize = 18.0,
    this.foldableRegionHeadingStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    this.foldableRegionHeadingOverflow = TextOverflow.ellipsis,
    this.closeButtonHoverDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(1024.0)),
    ),
    this.closeButtonColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.testSessionMenuItemHeight = 24.0,
    this.testSessionMenuItemUnselectedTabOpacity = 0.5,
    this.testSessionMenuItemPadding =
        const EdgeInsets.symmetric(horizontal: 8.0),
    this.testSessionMenuItemCloseButtonPadding =
        const EdgeInsets.only(left: 8.0),
    this.testSessionMenuItemCloseButtonSize = 12.0,
    this.testSessionMenuItemTextOverflow = TextOverflow.ellipsis,
    this.testSessionMenuItemTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.testSessionMenuItemIconSize = 18.0,
    this.testSessionMenuItemHoverTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.1),
    ),
    this.testSessionMenuItemTabIconPadding = const EdgeInsets.only(right: 8.0),
    this.testSessionMenuItemSelectedTabTintDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
    ),
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
    this.dialogBackgroundColor = const Color.fromRGBO(38, 39, 47, 0.75),
    this.dialogBarrierColor = const Color.fromRGBO(0, 0, 0, 0.35),
    this.dialogOpenCloseAnimationDuration = const Duration(milliseconds: 150),
    this.dialogOpenCloseAnimationCurve = Curves.easeInOutSine,
    this.dialogOpenCloseAnimationOffset = const Offset(0.0, -16.0),
    this.dialogAlignment = Alignment.center,
    this.dialogBlurRadius = 8.0,
    this.dialogBorderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.dialogBorderColor = const Color.fromRGBO(255, 255, 255, 0.025),
    this.dialogShadow = const [
      BoxShadow(
        blurRadius: 8.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
        spreadRadius: 4.0,
        offset: Offset(0.0, 4.0),
      ),
    ],
    this.dialogPadding = const EdgeInsets.all(8.0),
    this.dialogActionButtonHeight = 32.0,
    this.dialogActionButtonSectionBackgroundColor =
        const Color.fromRGBO(16, 18, 21, 0.5),
    this.baseDialogActionButtonRowWidth = 192.0,
    this.customDialogActionButtonWidthAddition = 32.0,
    this.distanceBetweenDialogContentAndActionButtons = 8.0,
    this.editColorButtonHeight = 28.0,
    this.editColorButtonDecorationForDarkColor = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.editColorButtonDecorationForBrightColor = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.editColorButtonBorderRadius =
        const BorderRadius.all(Radius.circular(5.0)),
    this.editColorButtonCheckerboardColor1 =
        const Color.fromRGBO(255, 255, 255, 1.0),
    this.editColorButtonCheckerboardColor2 =
        const Color.fromRGBO(192, 192, 192, 1.0),
    this.editColorButtonCheckerboardSize = 14.0,
    this.editColorButtonIcon = Icons.colorize_rounded,
    this.editColorButtonIconColorForDarkColor =
        const Color.fromRGBO(255, 255, 255, 0.9),
    this.editColorButtonIconColorForBrightColor =
        const Color.fromRGBO(0, 0, 0, 0.7),
    this.editColorButtonIconShadowsForDarkColor = const [
      Shadow(
        blurRadius: 2.0,
        color: Color.fromRGBO(0, 0, 0, 0.5),
        offset: Offset(0.0, 1.0),
      ),
    ],
    this.editColorButtonIconShadowsForBrightColor,
    this.editColorButtonIconAnimationDuration =
        const Duration(milliseconds: 250),
    this.editColorButtonIconAnimationCurve = Curves.ease,
    this.editColorButtonTextStyleForDarkColor = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      shadows: [
        Shadow(
          blurRadius: 2.0,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          offset: Offset(0.0, 1.0),
        ),
      ],
    ),
    this.editColorButtonTextStyleForBrightColor = const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.9),
    ),
    this.editColorDialogSizeChangeAnimationDuration =
        const Duration(milliseconds: 150),
    this.editColorDialogSizeChangeCurve = Curves.ease,
    this.editColorDialogElevation = 2.0,
    this.editColorDialogBorderRadius = 2.0,
    this.editColorDialogColorNameTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogPickerTypeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogSelectedPickerTypeColor =
        const Color.fromRGBO(82, 82, 82, 1.0),
    this.editColorDialogSpacing = 4.0,
    this.editColorDialogRunSpacing = 4.0,
    this.editColorDialogColumnSpacing = 8.0,
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
    this.createTestSessionDialogWidth = 512.0,
    this.createTestSessionDialogPadding = const EdgeInsets.all(8.0),
    this.createTestSessionDialogSearchResultsHeightFactor = 0.5,
    this.createTestSessionDialogSearchBarHeight = 32.0,
    this.createTestSessionDialogSearchResultsPadding =
        const EdgeInsets.only(top: 8.0),
    this.createTestSessionDialogSearchResultHeight = 28.0,
    this.createTestSessionDialogSelectedSearchResultDecoration =
        const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.15),
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.15),
        ),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    this.createTestSessionDialogUnselectedSearchResultDecoration =
        const BoxDecoration(),
    this.createTestSessionDialogSearchResultTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.createTestSessionDialogSearchResultIconPadding =
        const EdgeInsets.only(right: 8.0, left: 2.0),
    this.createTestSessionDialogSearchResultIconSize = 21.0,
    this.createTestSessionDialogSearchResultFadeDuration =
        const Duration(milliseconds: 100),
    this.createTestSessionDialogUnselectedSearchResultOpacity = 0.5,
    this.createTestSessionDialogNoMatchingResultsTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.selectedTabBoxDecoration = const BoxDecoration(
      color: Color.fromRGBO(41, 43, 53, 1.0),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
      ),
      boxShadow: [BoxShadow(
        blurRadius: 16.0,
        color: Color.fromRGBO(0, 0, 0, 0.5),
      )],
    ),
    this.unselectedTabBoxDecoration = const BoxDecoration(
      color: Colors.transparent,
    ),
    this.selectedTabAccentColorDecorationWidth = 3.0,
    this.tabSeparatorBoxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.0),
          Color.fromRGBO(255, 255, 255, 0.1),
          Color.fromRGBO(255, 255, 255, 0.0),
        ],
      ),
    ),
    this.tabLightReflectionBoxDecoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.3),
          Color.fromRGBO(255, 255, 255, 0.12),
          Color.fromRGBO(255, 255, 255, 0.1),
          Color.fromRGBO(255, 255, 255, 0.05),
          Color.fromRGBO(255, 255, 255, 0.02),
          Color.fromRGBO(255, 255, 255, 0.0),
        ],
      ),
    ),
    this.tabIconPadding = const EdgeInsets.only(right: 4.0),
    this.tabIconSize = 21.0,
    this.tabTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    this.unselectedHoveredTabOpacity = 0.7,
    this.unselectedNotHoveredTabOpacity = 0.4,
    this.unselectedTabOpacityChangeDuration = const Duration(milliseconds: 150),
    this.spaceAboveTabs = 4.0,
    this.tabContentPadding = const EdgeInsets.all(8.0),
    this.tabOpenAnimationDuration = const Duration(milliseconds: 150),
    this.tabOpenAnimationCurve = Curves.ease,
    this.dragHandleColor = Colors.blue,
    this.dragHandleSize = 6.0,
    this.dragHandleChangeOpacityDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
  });
}
