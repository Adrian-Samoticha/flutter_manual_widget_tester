import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';

class WidgetTestSessionHandler {
  final List<WidgetTestSession> _widgetTestSessions = [];
  int _currentIndex = -1;
  
  List<WidgetTestSession> get widgetTestSessions => _widgetTestSessions;
  
  void createNewSession(WidgetTestSession newWidgetTestSession) {
    _widgetTestSessions.add(newWidgetTestSession);
    currentIndex = _widgetTestSessions.length - 1;
  }
  
  void closeWidgetTestSession(int index) {
    _widgetTestSessions.removeAt(index);
    if (currentIndex >= index) {
      currentIndex -= 1;
    }
  }
  
  int get currentIndex => _currentIndex;
  
  set currentIndex(int newIndex) {
    if (_widgetTestSessions.isEmpty) {
      _currentIndex = -1;
      return;
    }
    
    _currentIndex = newIndex.clamp(0, _widgetTestSessions.length - 1);
  }
}