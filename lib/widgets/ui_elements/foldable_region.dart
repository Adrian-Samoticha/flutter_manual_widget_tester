import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';

class ManualWidgetTesterFoldableRegion extends StatefulWidget {
  final Widget child;
  final String heading;
  final bool isIndented;
  final bool isInitiallyFolded;

  const ManualWidgetTesterFoldableRegion(
      {Key? key,
      required this.child,
      required this.heading,
      this.isIndented = false,
      this.isInitiallyFolded = false})
      : super(key: key);

  @override
  State<ManualWidgetTesterFoldableRegion> createState() =>
      _ManualWidgetTesterFoldableRegionState();
}

class _ManualWidgetTesterFoldableRegionState
    extends State<ManualWidgetTesterFoldableRegion> {
  late bool _isFolded;

  @override
  void initState() {
    _isFolded = widget.isInitiallyFolded;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isIndented
          ? EdgeInsets.only(
              left: ManualWidgetTesterTheme.of(context)
                  .foldableRegionTheme
                  .indentationAmount)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(
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
            duration: ManualWidgetTesterTheme.of(context)
                .foldableRegionTheme
                .animationDuration,
            tween: Tween<double>(
                begin: _isFolded ? 0.0 : 1.0, end: _isFolded ? 0.0 : 1.0),
            curve: Curves.ease,
            builder: (context, value, child) {
              return ClipRect(
                clipBehavior: value < 1.0 ? Clip.antiAlias : Clip.none,
                child: Align(
                  alignment: ManualWidgetTesterTheme.of(context)
                      .foldableRegionTheme
                      .contentAlignment,
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

  const _Header(
      {required this.text,
      required this.isFolded,
      required this.onClicked,
      required this.isIndented});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => onClicked(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: isFolded
              ? ManualWidgetTesterTheme.of(context)
                  .foldableRegionTheme
                  .foldedHeaderOpacity
              : 1.0,
          child: Container(
            height: ManualWidgetTesterTheme.of(context)
                .foldableRegionTheme
                .headerHeight,
            color: isIndented
                ? Colors.transparent
                : ManualWidgetTesterTheme.of(context)
                    .foldableRegionTheme
                    .headerColor,
            child: Row(
              children: [
                Icon(
                  isFolded
                      ? Icons.keyboard_arrow_right_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: ManualWidgetTesterTheme.of(context)
                      .foldableRegionTheme
                      .chevronIconColor,
                  size: ManualWidgetTesterTheme.of(context)
                      .foldableRegionTheme
                      .chevronIconSize,
                ),
                Expanded(
                  child: Text(text,
                      softWrap: false,
                      overflow: ManualWidgetTesterTheme.of(context)
                          .foldableRegionTheme
                          .headingOverflow,
                      style: ManualWidgetTesterTheme.of(context)
                          .foldableRegionTheme
                          .headingStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
