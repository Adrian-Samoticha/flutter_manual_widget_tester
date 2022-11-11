import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';

class ManualWidgetTesterFoldableRegion extends StatefulWidget {
  final Widget child;
  final String heading;
  final ManualWidgetTesterThemeSettings themeSettings;
  final bool isIndented;

  const ManualWidgetTesterFoldableRegion(
      {Key? key,
      required this.child,
      required this.heading,
      required this.themeSettings,
      this.isIndented = false})
      : super(key: key);

  @override
  State<ManualWidgetTesterFoldableRegion> createState() =>
      _ManualWidgetTesterFoldableRegionState();
}

class _ManualWidgetTesterFoldableRegionState
    extends State<ManualWidgetTesterFoldableRegion> {
  bool _isFolded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isIndented
          ? EdgeInsets.only(
              left: widget.themeSettings.foldableRegionIndentationAmount)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(
            themeSettings: widget.themeSettings,
            text: widget.heading,
            isFolded: _isFolded,
            isIndented: widget.isIndented,
            onClicked: () {
              setState(() {
                _isFolded = !_isFolded;
              });
            },
          ),
          TweenAnimationBuilder<double>(
            duration: widget.themeSettings.foldableRegionAnimationDuration,
            tween: Tween<double>(
                begin: _isFolded ? 0.0 : 1.0, end: _isFolded ? 0.0 : 1.0),
            curve: Curves.ease,
            builder: (context, value, child) {
              return ClipRect(
                clipBehavior: value < 1.0 ? Clip.antiAlias : Clip.none,
                child: Align(
                  alignment:
                      widget.themeSettings.foldableRegionContentAlignment,
                  heightFactor: value,
                  child: child,
                ),
              );
            },
            child: widget.child,
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  final bool isFolded;
  final void Function() onClicked;
  final bool isIndented;
  final ManualWidgetTesterThemeSettings themeSettings;

  const _Header(
      {required this.text,
      required this.isFolded,
      required this.onClicked,
      required this.isIndented,
      required this.themeSettings});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => onClicked(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity:
              isFolded ? themeSettings.foldableRegionFoldedHeaderOpacity : 1.0,
          child: Container(
            height: themeSettings.foldableRegionHeaderHeight,
            color: isIndented
                ? Colors.transparent
                : themeSettings.foldableRegionHeaderColor,
            child: Row(
              children: [
                Icon(
                  isFolded
                      ? Icons.keyboard_arrow_right_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: themeSettings.foldableRegionChevronIconColor,
                  size: themeSettings.foldableRegionChevronIconSize,
                ),
                Expanded(
                  child: Text(text,
                      softWrap: false,
                      overflow: themeSettings.foldableRegionHeadingOverflow,
                      style: themeSettings.foldableRegionHeadingStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
