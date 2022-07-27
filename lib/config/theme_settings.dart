import 'package:flutter/material.dart';

class ManualWidgetTesterThemeSettings {
  final Color backgroundColor;
  final Color sidebarColor;
  final double appBarHeight;
  final Color accentColor;
  final double minTabWidth;
  final double maxTabWidth;
  final Color dottedLineColor;
  final TextStyle widgetSizeTextStyle;
  final Color defaultIconColor;
  final Color buttonColor;
  final Radius buttonBorderRadius;
  final List<BoxShadow> buttonShadow;
  final Color buttonPressedTint;
  final Color buttonHoveredTint;
  final Offset buttonPressedOffset;
  final Color buttonSeparatorColor;
  final double buttonSeparatorWidth;
  final IconThemeData disabledButtonIconTheme;
  final IconThemeData pressedButtonIconTheme;
  final IconThemeData buttonIconTheme;
  final TextStyle disabledButtonTextStyle;
  final TextStyle pressedButtonTextStyle;
  final TextStyle buttonTextStyle;
  final List<BoxShadow> textFieldShadow;
  final Radius textFieldBorderRadius;
  final Color textFieldColor;
  final Color textFieldBorderColor;
  final double textFieldBorderWidth;
  final TextStyle textFieldTextStyle;
  final TextStyle textFieldSuffixStyle;
  final Color textFieldCursorColor;
  final Color textFieldSelectionColor;
  final EdgeInsetsGeometry textFieldContentPadding;
  final double zoomControlsWidth;
  final double zoomControlsHeight;
  final BorderRadius zoomControlsBorderRadius;
  final List<BoxShadow> zoomControlsShadow;
  final EdgeInsets zoomControlsPadding;
  final double spaceBetweenTextBoxesAndButtonRows;
  final double zoomControlsButtonRowWidth;
  final Icon zoomControlsZoomOutIcon;
  final Icon zoomControlsZoomInIcon;
  final double zoomControlsDistanceToBorder;
  final Alignment zoomControlsAlignment;
  final double foldableRegionIndentationAmount;
  final Duration foldableRegionAnimationDuration;
  final Alignment foldableRegionContentAlignment;
  final double foldableRegionHeaderHeight;
  final double foldableRegionFoldedHeaderOpacity;
  final Color foldableRegionHeaderColor;
  final Color foldableRegionChevronIconColor;
  final double foldableRegionChevronIconSize;
  final TextStyle foldableRegionHeadingStyle;
  final TextOverflow foldableRegionHeadingOverflow;
  final BoxDecoration closeButtonHoverDecoration;
  final Color closeButtonColor;
  final double testSessionMenuItemHeight;
  final double testSessionMenuItemUnselectedTabOpacity;
  final EdgeInsets testSessionMenuItemPadding;
  final EdgeInsets testSessionMenuItemCloseButtonPadding;
  final double testSessionMenuItemCloseButtonSize;
  final TextOverflow testSessionMenuItemTextOverflow;
  final TextStyle testSessionMenuItemTextStyle;
  final double testSessionMenuItemIconSize;
  final BoxDecoration testSessionMenuItemHoverTintDecoration;
  final EdgeInsets testSessionMenuItemTabIconPadding;
  final BoxDecoration testSessionMenuItemSelectedTabTintDecoration;
  final EdgeInsets noEditorMessagePadding;
  final EdgeInsets noEditorMessageMargin;
  final BoxDecoration noEditorMessageDecoration;
  final EdgeInsets noCustomSettingsMessagePadding;
  final TextStyle noCustomSettingsMessageTextStyle;
  final TextStyle noEditorTextStyle;
  final TextStyle noEditorHighlightedTextStyle;
  final TextStyle customSettingHeadingTextStyle;
  final TextOverflow customSettingHeadingOverflow;
  final EdgeInsets customSettingsHeadingPadding;
  final EdgeInsets customSettingsPadding;
  final double stringEditorHeight;
  final Color dialogBackgroundColor;
  final Color dialogBarrierColor;
  final Duration dialogOpenCloseAnimationDuration;
  final Curve dialogOpenCloseAnimationCurve;
  final Offset dialogOpenCloseAnimationOffset;
  final Alignment dialogAlignment;
  final double dialogBlurRadius;
  final BorderRadius dialogBorderRadius;
  final Color dialogBorderColor;
  final List<BoxShadow> dialogShadow;
  final EdgeInsets dialogPadding;
  final double dialogActionButtonHeight;
  final double defaultDialogActionButtonRowWidth;
  final double customDialogActionButtonWidthAddition;
  final double distanceBetweenDialogContentAndActionButtons;
  final double editColorButtonHeight;
  final BoxDecoration editColorButtonDecorationForDarkColor;
  final BoxDecoration editColorButtonDecorationForBrightColor;
  final BorderRadius editColorButtonBorderRadius;
  final Color editColorButtonCheckerboardColor1;
  final Color editColorButtonCheckerboardColor2;
  final double editColorButtonCheckerboardSize;
  final IconData editColorButtonIcon;
  final Color editColorButtonIconColorForDarkColor;
  final Color editColorButtonIconColorForBrightColor;
  final List<Shadow>? editColorButtonIconShadowsForDarkColor;
  final List<Shadow>? editColorButtonIconShadowsForBrightColor;
  final Duration editColorButtonIconAnimationDuration;
  final Curve editColorButtonIconAnimationCurve;
  final TextStyle editColorButtonTextStyleForDarkColor;
  final TextStyle editColorButtonTextStyleForBrightColor;
  final Duration editColorDialogSizeChangeAnimationDuration;
  final Curve editColorDialogSizeChangeCurve;
  final double editColorDialogElevation;
  final double editColorDialogBorderRadius;
  final TextStyle editColorDialogColorNameTextStyle;
  final TextStyle editColorDialogTypeTextStyle;
  final Color editColorDialogSelectedPickerTypeColor;
  final double editColorDialogSpacing;
  final double editColorDialogRunSpacing;
  final double editColorDialogColumnSpacing;
  final double defaultIntegerEditorButtonRowWidth;
  
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
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.2), offset: Offset(0.0, 1.0))
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
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.2), offset: Offset(0.0, 1.0))
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
      BoxShadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0.0, 1.0)),
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
      fontWeight: FontWeight.w700
    ),
    this.foldableRegionHeadingOverflow = TextOverflow.ellipsis,
    this.closeButtonHoverDecoration = const BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(1024.0)),
    ),
    this.closeButtonColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.testSessionMenuItemHeight = 24.0,
    this.testSessionMenuItemUnselectedTabOpacity = 0.5,
    this.testSessionMenuItemPadding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.testSessionMenuItemCloseButtonPadding = const EdgeInsets.only(left: 8.0),
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
      BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.25), spreadRadius: 4.0, offset: Offset(0.0, 4.0)),
    ],
    this.dialogPadding = const EdgeInsets.all(8.0),
    this.dialogActionButtonHeight = 32.0,
    this.defaultDialogActionButtonRowWidth = 192.0,
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
        BoxShadow(blurRadius: 3.0, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0.0, 1.0)),
      ],
    ),
    this.editColorButtonDecorationForBrightColor = const BoxDecoration(
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
      boxShadow: [
        BoxShadow(blurRadius: 3.0, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0.0, 1.0)),
      ],
    ),
    this.editColorButtonBorderRadius = const BorderRadius.all(Radius.circular(5.0)),
    this.editColorButtonCheckerboardColor1 = const Color.fromRGBO(255, 255, 255, 1.0),
    this.editColorButtonCheckerboardColor2 = const Color.fromRGBO(192, 192, 192, 1.0),
    this.editColorButtonCheckerboardSize = 14.0,
    this.editColorButtonIcon = Icons.colorize_rounded,
    this.editColorButtonIconColorForDarkColor = const Color.fromRGBO(255, 255, 255, 0.9),
    this.editColorButtonIconColorForBrightColor = const Color.fromRGBO(0, 0, 0, 0.7),
    this.editColorButtonIconShadowsForDarkColor = const [
      Shadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.5), offset: Offset(0.0, 1.0)),
    ],
    this.editColorButtonIconShadowsForBrightColor,
    this.editColorButtonIconAnimationDuration = const Duration(milliseconds: 250),
    this.editColorButtonIconAnimationCurve = Curves.ease,
    this.editColorButtonTextStyleForDarkColor = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      shadows: [
        Shadow(blurRadius: 2.0, color: Color.fromRGBO(0, 0, 0, 0.5), offset: Offset(0.0, 1.0)),
      ]
    ),
    this.editColorButtonTextStyleForBrightColor = const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.9),
    ),
    this.editColorDialogSizeChangeAnimationDuration = const Duration(milliseconds: 150),
    this.editColorDialogSizeChangeCurve = Curves.ease,
    this.editColorDialogElevation = 2.0,
    this.editColorDialogBorderRadius = 2.0,
    this.editColorDialogColorNameTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogTypeTextStyle = const TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.9),
    ),
    this.editColorDialogSelectedPickerTypeColor = const Color.fromRGBO(82, 82, 82, 1.0),
    this.editColorDialogSpacing = 4.0,
    this.editColorDialogRunSpacing = 4.0,
    this.editColorDialogColumnSpacing = 8.0,
    this.defaultIntegerEditorButtonRowWidth = 64.0,
  });
}