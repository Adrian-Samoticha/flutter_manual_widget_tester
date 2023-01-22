import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'theme_generator/theme_generator_parameters.dart';

class ManualWidgetTesterTabTheme extends Equatable {
  /// The minimal tab width.
  ///
  /// **Note:** The tabs will resize themselves based on the current window
  /// size.
  final double minTabWidth;

  /// The maximal tab width.
  ///
  /// **Note:** The tabs will resize themselves based on the current window
  /// size.
  final double maxTabWidth;

  /// The box decoration of the focused tab.
  final BoxDecoration focusedTabBoxDecoration;

  /// The box decoration of the unfocused tabs.
  final BoxDecoration unfocusedTabBoxDecoration;

  /// The width of the decoration of the focused tab.
  final double focusedTabAccentColorDecorationWidth;

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

  /// The opacity of unfocused tabs that are being hovered over.
  final double unfocusedHoveredTabOpacity;

  /// The opacity of unfocused tabs that are *not* being hovered over.
  final double unfocusedNotHoveredTabOpacity;

  /// The duration of the opacity change animation that plays when an unfocused
  /// tab is hovered over.
  final Duration unfocusedTabOpacityChangeDuration;

  /// The space above the tab bar.
  final double spaceAboveTabs;

  /// The padding of the tabs' content.
  final EdgeInsets tabContentPadding;

  /// The duration of the animation that plays when a new tab has been opened.
  final Duration tabOpenAnimationDuration;

  /// The animation curve of the animation that plays when a new tab has been
  /// opened.
  final Curve tabOpenAnimationCurve;

  const ManualWidgetTesterTabTheme({
    this.minTabWidth = 94.0,
    this.maxTabWidth = 192.0,
    this.focusedTabBoxDecoration = const BoxDecoration(
      color: Color.fromRGBO(41, 43, 53, 1.0),
      border: GradientBoxBorder(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.2),
            Colors.transparent,
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        width: 1.0,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 16.0,
          color: Color.fromRGBO(0, 0, 0, 0.5),
        )
      ],
    ),
    this.unfocusedTabBoxDecoration = const BoxDecoration(
      color: Colors.transparent,
    ),
    this.focusedTabAccentColorDecorationWidth = 3.0,
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
    this.unfocusedHoveredTabOpacity = 0.7,
    this.unfocusedNotHoveredTabOpacity = 0.4,
    this.unfocusedTabOpacityChangeDuration = const Duration(milliseconds: 150),
    this.spaceAboveTabs = 4.0,
    this.tabContentPadding = const EdgeInsets.all(8.0),
    this.tabOpenAnimationDuration = const Duration(milliseconds: 150),
    this.tabOpenAnimationCurve = Curves.ease,
  });

  @override
  List<Object?> get props => [
        minTabWidth,
        maxTabWidth,
        focusedTabBoxDecoration,
        unfocusedTabBoxDecoration,
        focusedTabAccentColorDecorationWidth,
        tabSeparatorBoxDecoration,
        tabLightReflectionBoxDecoration,
        tabIconPadding,
        tabIconSize,
        tabTextStyle,
        unfocusedHoveredTabOpacity,
        unfocusedNotHoveredTabOpacity,
        unfocusedTabOpacityChangeDuration,
        spaceAboveTabs,
        tabContentPadding,
        tabOpenAnimationDuration,
        tabOpenAnimationCurve,
      ];

  static ManualWidgetTesterTabTheme fromThemeGeneratorParameters(
      ThemeGeneratorParameters parameters) {
    return ManualWidgetTesterTabTheme(
      minTabWidth: _getMinTabWidthFromLayout(parameters.layout),
      maxTabWidth: _getMaxTabWidthFromLayout(parameters.layout),
      focusedTabBoxDecoration: _getFocusedTabBoxDecoration(parameters),
      // unfocusedTabBoxDecoration:
      // focusedTabAccentColorDecorationWidth:
      tabSeparatorBoxDecoration:
          _getTabSeparatorBoxDecorationFromBrightness(parameters.brightness),
      tabLightReflectionBoxDecoration:
          _getTabLightReflectionBoxDecorationFromDesignLanguage(
              parameters.designLanguage),
      tabTextStyle: _getTabTextStyle(parameters),
      unfocusedTabOpacityChangeDuration:
          _getUnfocusedTabOpacityChangeDurationFromAnimationSpeed(
              parameters.animationSpeed),
      tabContentPadding: _getTabContentPaddingFromLayout(parameters.layout),
      tabOpenAnimationDuration: _getTabOpenAnimationDurationFromAnimationSpeed(
          parameters.animationSpeed),
    );
  }

  static double _getMinTabWidthFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 62.0;
      case Layout.normal:
        return 94.0;
      case Layout.cozy:
        return 126.0;
    }
  }

  static double _getMaxTabWidthFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return 128.0;
      case Layout.normal:
        return 192.0;
      case Layout.cozy:
        return 256.0;
    }
  }

  static BoxDecoration _getFocusedTabBoxDecoration(
      ThemeGeneratorParameters parameters) {
    switch (parameters.designLanguage) {
      case DesignLanguage.skeuomorphic:
        return BoxDecoration(
          color: parameters.filteredBackgroundColor,
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.2),
                Colors.transparent,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.circular(3.0),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16.0,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            )
          ],
        );

      case DesignLanguage.flat:
        return BoxDecoration(
          color: parameters.filteredBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.circular(3.0),
          ),
        );
    }
  }

  static BoxDecoration _getTabSeparatorBoxDecorationFromBrightness(
      Brightness brightness) {
    final color = brightness == Brightness.dark ? Colors.white : Colors.black;

    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.0),
          color.withOpacity(0.1),
          color.withOpacity(0.0),
        ],
      ),
    );
  }

  static BoxDecoration _getTabLightReflectionBoxDecorationFromDesignLanguage(
      DesignLanguage designLanguage) {
    switch (designLanguage) {
      case DesignLanguage.skeuomorphic:
        return const BoxDecoration(
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
        );

      case DesignLanguage.flat:
        return const BoxDecoration();
    }
  }

  static TextStyle _getTabTextStyle(ThemeGeneratorParameters parameters) {
    return TextStyle(
      color: parameters.brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      fontSize: parameters.layout == Layout.compact ? 10.0 : 12.0,
      fontWeight: FontWeight.w600,
    );
  }

  static Duration _getUnfocusedTabOpacityChangeDurationFromAnimationSpeed(
      AnimationSpeed animationSpeed) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 100);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 200);
    }
  }

  static EdgeInsets _getTabContentPaddingFromLayout(Layout layout) {
    switch (layout) {
      case Layout.compact:
        return const EdgeInsets.all(4.0);
      case Layout.normal:
        return const EdgeInsets.all(8.0);
      case Layout.cozy:
        return const EdgeInsets.all(8.0);
    }
  }

  static Duration _getTabOpenAnimationDurationFromAnimationSpeed(
      AnimationSpeed animationSpeed) {
    switch (animationSpeed) {
      case AnimationSpeed.instant:
        return const Duration();
      case AnimationSpeed.quick:
        return const Duration(milliseconds: 100);
      case AnimationSpeed.normal:
        return const Duration(milliseconds: 150);
      case AnimationSpeed.slow:
        return const Duration(milliseconds: 400);
    }
  }
}
