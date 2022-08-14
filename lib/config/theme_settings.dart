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
  final double defaultNumberEditorButtonRowWidth;
  final double spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView;
  final double doubleEditorInfiniteScrollViewHeight;
  final BoxDecoration doubleEditorInfiniteScrollViewBoxDecoration;
  final EdgeInsets doubleEditorInfiniteScrollViewPadding;
  final TextStyle doubleEditorInfiniteScrollViewTextStyle;
  final double doubleEditorInfiniteScrollViewTextPaddingAmount;
  final Color doubleEditorInfiniteScrollViewLineColor;
  final double doubleEditorInfiniteScrollViewLineWidth;
  final Color doubleEditorInfiniteScrollViewIndicatorColor;
  final double doubleEditorInfiniteScrollViewIndicatorWidth;
  final double doubleEditorInfiniteScrollViewIndicatorHeight;
  final Widget selectedRadioButton;
  final Widget unselectedRadioButton;
  final double spaceBetweenRadioButtonAndLabel;
  final TextStyle selectedRadioButtonLabelStyle;
  final TextStyle unselectedRadioButtonLabelStyle;
  final double boolEditorMaxWidth;
  final double boolEditorSpaceBetweenRadioButtons;
  final EdgeInsets boolEditorRadioButtonPadding;
  final double boolEditorHeight;
  final EdgeInsets createTestSessionButtonPadding;
  final double createTestSessionDialogWidth;
  final EdgeInsets createTestSessionDialogPadding;
  final double createTestSessionDialogSearchResultsHeightFactor;
  final double createTestSessionDialogSearchBarHeight;
  final EdgeInsets createTestSessionDialogSearchResultsPadding;
  final double createTestSessionDialogSearchResultHeight;
  final BoxDecoration createTestSessionDialogSelectedSearchResultDecoration;
  final BoxDecoration createTestSessionDialogUnselectedSearchResultDecoration;
  final TextStyle createTestSessionDialogSearchResultTextStyle;
  final EdgeInsets createTestSessionDialogSearchResultIconPadding;
  final double createTestSessionDialogSearchResultIconSize;
  final Duration createTestSessionDialogSearchResultFadeDuration;
  final double createTestSessionDialogUnselectedSearchResultOpacity;
  final TextStyle createTestSessionDialogNoMatchingResultsTextStyle;
  final BoxDecoration selectedTabBoxDecoration;
  final BoxDecoration unselectedTabBoxDecoration;
  final double selectedTabAccentColorDecorationWidth;
  final BoxDecoration tabSeparatorBoxDecoration;
  final BoxDecoration tabLightReflectionBoxDecoration;
  final EdgeInsets tabIconPadding;
  final double tabIconSize;
  final TextStyle tabTextStyle;
  final double unselectedHoveredTabOpacity;
  final double unselectedNotHoveredTabOpacity;
  final Duration unselectedTabOpacityChangeDuration;
  final double spaceAboveTabs;
  final EdgeInsets tabContentPadding;
  final Color dragHandleColor;
  final double dragHandleSize;
  final Duration dragHandleChangeOpacityDuration;
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
    this.defaultNumberEditorButtonRowWidth = 64.0,
    this.spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView = 4.0,
    this.doubleEditorInfiniteScrollViewHeight = 32.0,
    this.doubleEditorInfiniteScrollViewBoxDecoration = const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      boxShadow: [
        BoxShadow(color: Color.fromRGBO(18, 20, 23, 1.0)),
        BoxShadow(color: Color.fromRGBO(43, 47, 54, 1.0), spreadRadius: -2.0, blurRadius: 5.5, offset: Offset(0.0, 1.0)),
      ],
      border: Border.fromBorderSide(
        BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.075),
        ),
      ),
    ),
    this.doubleEditorInfiniteScrollViewPadding = const EdgeInsets.symmetric(vertical: 2.0),
    this.doubleEditorInfiniteScrollViewTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
    ),
    this.doubleEditorInfiniteScrollViewTextPaddingAmount = 4.0,
    this.doubleEditorInfiniteScrollViewLineColor = const Color.fromRGBO(255, 255, 255, 1.0),
    this.doubleEditorInfiniteScrollViewLineWidth = 1.1,
    this.doubleEditorInfiniteScrollViewIndicatorColor = const Color.fromRGBO(32, 145, 255, 1.0),
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
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.5), blurRadius: 2.0, offset: Offset(0.5, 1.0), spreadRadius: 1.0),
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
              BoxShadow(color: Color.fromRGBO(32, 175, 255, 1.0), spreadRadius: -2.0, blurRadius: 2.5, offset: Offset(-1.0, -1.0)),
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
    this.boolEditorRadioButtonPadding = const EdgeInsets.symmetric(vertical: 8.0),
    this.boolEditorHeight = 16.0,
    this.createTestSessionButtonPadding = const EdgeInsets.all(6.5),
    this.createTestSessionDialogWidth = 512.0,
    this.createTestSessionDialogPadding = const EdgeInsets.all(8.0),
    this.createTestSessionDialogSearchResultsHeightFactor = 0.5,
    this.createTestSessionDialogSearchBarHeight = 32.0,
    this.createTestSessionDialogSearchResultsPadding = const EdgeInsets.only(top: 8.0),
    this.createTestSessionDialogSearchResultHeight = 28.0,
    this.createTestSessionDialogSelectedSearchResultDecoration = const BoxDecoration(
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
    this.createTestSessionDialogUnselectedSearchResultDecoration = const BoxDecoration(),
    this.createTestSessionDialogSearchResultTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.createTestSessionDialogSearchResultIconPadding = const EdgeInsets.only(right: 8.0, left: 2.0),
    this.createTestSessionDialogSearchResultIconSize = 21.0,
    this.createTestSessionDialogSearchResultFadeDuration = const Duration(milliseconds: 100),
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
        ]
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
        ]
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
    this.dragHandleColor = Colors.blue,
    this.dragHandleSize = 6.0,
    this.dragHandleChangeOpacityDuration = const Duration(milliseconds: 150),
    this.timeUntilDragHandleAppears = const Duration(milliseconds: 250),
  });
}