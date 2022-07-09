import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/util/mouse_cursor_overrider.dart';
import 'package:flutter_manual_widget_tester/widgets/test_session_menu_item.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/foldable_region.dart';

class ManualWidgetTesterSidebar extends StatefulWidget {
  const ManualWidgetTesterSidebar({Key? key, required this.maxWidth, required this.mouseCursorOverrider, required this.themeSettings, required this.widgetTestSessionHandler, required this.typeEditorBuilder}) : super(key: key);
  
  final ManualWidgetTesterThemeSettings themeSettings;
  final double maxWidth;
  final MouseCursorOverrider mouseCursorOverrider;
  final WidgetTestSessionHandler widgetTestSessionHandler;
  final TypeEditorBuilder typeEditorBuilder;

  @override
  State<ManualWidgetTesterSidebar> createState() => _ManualWidgetTesterSidebarState();
}

class _ManualWidgetTesterSidebarState extends State<ManualWidgetTesterSidebar> {
  double _draggedWidth = 128.0;
  late StreamSubscription<WidgetTestSessionHandler> _widgetTestSessionsChangedStream;
  
  @override
  void initState() {
    _widgetTestSessionsChangedStream = widget.widgetTestSessionHandler.registerOnChangedCallback((_) {
      setState(() {});
    });
    
    super.initState();
  }
  
  @override
  void dispose() {
    _widgetTestSessionsChangedStream.cancel();
    
    super.dispose();
  }
  
  double _getLegalDisplayWidthFromDraggedWidth(double draggedWidth) {
    const lowerBound = 96.0;
    final upperBound = widget.maxWidth;
    
    if (lowerBound > upperBound) {
      return 0.0;
    }
    
    return draggedWidth.clamp(lowerBound, upperBound);
  }
  
  @override
  Widget build(BuildContext context) {
    final displayWidth = _getLegalDisplayWidthFromDraggedWidth(_draggedWidth);
    
    return Container(
      width: displayWidth,
      color: widget.themeSettings.sidebarColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                ManualWidgetTesterFoldableRegion(
                  heading: 'RUNNING TEST SESSIONS',
                  themeSettings: widget.themeSettings,
                  child: Column(
                    children: _generateTestSessionColumnChildren(),
                  ),
                ),
                ...widget.widgetTestSessionHandler.widgetTestSessions.isEmpty ? const [] : [
                  ManualWidgetTesterFoldableRegion(
                    heading: '${_getCurrentTestSessionNameFormatted()} SETTINGS',
                    themeSettings: widget.themeSettings,
                    child: Column(
                      children: [
                        ManualWidgetTesterFoldableRegion(
                          isIndented: true,
                          heading: 'CUSTOM SETTINGS',
                          themeSettings: widget.themeSettings,
                          child: Column(
                            children: _generateCustomSettingsChildren(),
                          ),
                        ),
                        ManualWidgetTesterFoldableRegion(
                          isIndented: true,
                          heading: 'GENERIC SETTINGS',
                          themeSettings: widget.themeSettings,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _HorizontalDragHandle(
              mouseCursorOverrider: widget.mouseCursorOverrider,
              onDragStart: () {
                _draggedWidth = displayWidth;
              },
              onDragUpdate: (delta) => setState(() {
                _draggedWidth += delta;
              }),
            ),
          ),
        ],
      ),
    );
  }
  
  String _getCurrentTestSessionNameFormatted() {
    final currentName = _getCurrentTestSessionName();
    return StringUtils.camelCaseToUpperUnderscore(currentName)
    .replaceAll('_', ' ')
    .replaceAll('.', '')
    .replaceAll('  ', ' ')
    .trim();
  }
  
  String _getCurrentTestSessionName() {
    final sessionHandler = widget.widgetTestSessionHandler;
    return sessionHandler.widgetTestSessions[sessionHandler.currentIndex].name;
  }
  
  List<Widget> _generateCustomSettingsChildren() {
    final currentIndex = widget.widgetTestSessionHandler.currentIndex;
    final currentTestSession = widget.widgetTestSessionHandler.widgetTestSessions[currentIndex];
    final customSettings = currentTestSession.customSettings;
    
    if (customSettings.settings.isEmpty) {
      return [
        _generateNoSettingsText(),
      ];
    }
    
    return customSettings.settings.map((String settingName, dynamic settingValue) {
      final settingType = settingValue.runtimeType;
      
      if (!widget.typeEditorBuilder.hasEditorBuilderInstalledForType(settingType)) {
        final widgetToBeReturned = _generateNoEditorMessage(settingName, settingValue);
        
        return MapEntry<String, Widget>(settingName, widgetToBeReturned);
      }
      
      final widgetToBeReturned = widget.typeEditorBuilder.buildEditor(settingName, settingType, settingValue, (newValue) {
        customSettings.setSetting(settingName, newValue);
      });
      
      return MapEntry<String, Widget>(settingName, widgetToBeReturned);
    }).values.toList();
  }

  Container _generateNoEditorMessage(String settingName, settingValue) {
    return Container(
      padding: widget.themeSettings.noEditorMessagePadding,
      margin: widget.themeSettings.noEditorMessageMargin,
      decoration: widget.themeSettings.noEditorMessageDecoration,
      child: _generateNoEditorText(settingName, settingValue),
    );
  }

  Padding _generateNoSettingsText() {
    return Padding(
      padding: widget.themeSettings.noCustomSettingsMessagePadding,
      child: Text(
        'This test session has no custom settings.',
        style: widget.themeSettings.noCustomSettingsMessageTextStyle,
      ),
    );
  }

  RichText _generateNoEditorText(String settingName, settingValue) {
    return RichText(
      text: TextSpan(
        text: 'Could not build type editor for setting ',
        style: widget.themeSettings.noEditorTextStyle,
        children: [
          TextSpan(
            text: settingName,
            style: widget.themeSettings.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: ' which is of type ',
          ),
          TextSpan(
            text: '${settingValue.runtimeType}',
            style: widget.themeSettings.noEditorHighlightedTextStyle,
          ),
          const TextSpan(
            text: '. No editor for that type has been provided.',
          ),
        ],
      ),
    );
  }
  
  List<Widget> _generateTestSessionColumnChildren() {
    final enableIcons = widget.widgetTestSessionHandler.widgetTestSessions.where((element) => element.icon != null).isNotEmpty;
    
    return widget.widgetTestSessionHandler.widgetTestSessions.asMap().map((int index, WidgetTestSession session) {
      final toBeReturnedWidget = ManualWidgetTesterTestSessionMenuItem(
        widgetName: session.name,
        iconColor: session.iconColor ?? widget.themeSettings.defaultIconColor,
        icon: session.icon,
        themeSettings: widget.themeSettings,
        onSelect: () {
          widget.widgetTestSessionHandler.currentIndex = index;
        },
        onClose: () {
          widget.widgetTestSessionHandler.closeWidgetTestSession(index);
        },
        tabIndex: index,
        selectedTabIndex: widget.widgetTestSessionHandler.currentIndex,
        enableIcon: enableIcons,
      );
      
      return MapEntry(index, toBeReturnedWidget);
    }).values.toList();
  }
}

class _HorizontalDragHandle extends StatefulWidget {
  const _HorizontalDragHandle({Key? key, required this.onDragUpdate, required this.onDragStart, required this.mouseCursorOverrider}) : super(key: key);
  
  final void Function() onDragStart;
  final void Function(double) onDragUpdate;
  final MouseCursorOverrider mouseCursorOverrider;

  @override
  State<_HorizontalDragHandle> createState() => _HorizontalDragHandleState();
}

class _HorizontalDragHandleState extends State<_HorizontalDragHandle> {
  int _mouseCursorOverrideId = 0;
  bool _isBeingDragged = false;
  bool _isBeingHovered = false;
  Timer? _hoverTimer;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: MouseRegion(
        onEnter: (event) => _hoverTimer = Timer(const Duration(milliseconds: 250), () {
          setState(() {
            _isBeingHovered = true;
          });
        }),
        onExit: (event) {
          _hoverTimer?.cancel();
          setState(() {
            _isBeingHovered = false;
          });
        },
        child: GestureDetector(
          onHorizontalDragStart: (details) {
            _mouseCursorOverrideId = widget.mouseCursorOverrider.overrideMouseCursor(SystemMouseCursors.resizeLeftRight);
            setState(() => _isBeingDragged = true);
            widget.onDragStart();
          },
          onHorizontalDragEnd: (details) {
            widget.mouseCursorOverrider.cancelOverride(_mouseCursorOverrideId);
            setState(() => _isBeingDragged = false);
          },
          onHorizontalDragUpdate: (details) => widget.onDragUpdate(details.delta.dx),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 6.0,
            color: _isBeingDragged || _isBeingHovered ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
    );
  }
}