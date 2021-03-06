import 'dart:async';

import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';

class WidgetTestSessionHandler {
  final List<WidgetTestSession> _widgetTestSessions = [];
  final Map<WidgetTestSession, StreamSubscription> _onCustomSettingsChangedStreamSubscriptions = {};
  int _currentIndex = -1;
  final StreamController<WidgetTestSessionHandler> _onChangedStream = StreamController.broadcast();
  
  List<WidgetTestSession> get widgetTestSessions => _widgetTestSessions;
  
  void createNewSession(WidgetTestSession newWidgetTestSession) {
    _widgetTestSessions.add(newWidgetTestSession);
    currentIndex = _widgetTestSessions.length - 1;
    
    StreamSubscription onCustomSettingsChangedStreamSubscription = newWidgetTestSession.customSettings.registerOnChangedCallback((_) {
      _onChangedStream.add(this);
    });
    _onCustomSettingsChangedStreamSubscriptions[newWidgetTestSession] = onCustomSettingsChangedStreamSubscription;
  }
  
  void closeWidgetTestSession(int index) {
    if (index >= _widgetTestSessions.length) {
      throw ArgumentError('Attempting to close test session at out-of-bounds index $index.');
    }
    
    final removedTestSession = _widgetTestSessions.removeAt(index);
    _onCustomSettingsChangedStreamSubscriptions[removedTestSession]?.cancel();
    if (currentIndex >= index) {
      currentIndex -= 1;
    } else {
      _onChangedStream.add(this);
    }
  }
  
  int get currentIndex => _currentIndex;
  
  set currentIndex(int newIndex) {
    _onChangedStream.add(this);
    
    if (_widgetTestSessions.isEmpty) {
      _currentIndex = -1;
      return;
    }
    
    _currentIndex = newIndex.clamp(0, _widgetTestSessions.length - 1);
  }
  
  StreamSubscription<WidgetTestSessionHandler> registerOnChangedCallback(void Function(WidgetTestSessionHandler) callback) {
    return _onChangedStream.stream.listen(callback);
  }
}