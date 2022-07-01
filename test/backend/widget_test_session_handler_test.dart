import 'package:flutter_manual_widget_tester/backend/widget_test_session.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test session handler basic functionality', (tester) async {
    final sessionHandler = WidgetTestSessionHandler();
    
    // Initially, the length and index are expected to be 0 and -1, respectively.
    expect(sessionHandler.widgetTestSessions.length, 0);
    expect(sessionHandler.currentIndex, -1);
    
    // The index is expected to be -1 when the test session list is empty.
    sessionHandler.currentIndex = 100;
    expect(sessionHandler.currentIndex, -1);
    
    sessionHandler.currentIndex = -100;
    expect(sessionHandler.currentIndex, -1);
    
    // Create 3 test sessions.
    // Creating a new test session is supposed to update the index, such that
    // the current index points to the newly created session.
    sessionHandler.createNewSession(WidgetTestSession(name: '0'));
    expect(sessionHandler.currentIndex, 0);
    sessionHandler.createNewSession(WidgetTestSession(name: '1'));
    expect(sessionHandler.currentIndex, 1);
    sessionHandler.createNewSession(WidgetTestSession(name: '2'));
    expect(sessionHandler.currentIndex, 2);
    
    // Check if the test session list is correct.
    expect(sessionHandler.widgetTestSessions.length, 3);
    expect(sessionHandler.widgetTestSessions[0].name, '0');
    expect(sessionHandler.widgetTestSessions[1].name, '1');
    expect(sessionHandler.widgetTestSessions[2].name, '2');
    
    // Check if the current index can be changed.
    sessionHandler.currentIndex = 1;
    expect(sessionHandler.currentIndex, 1);
    
    // The current index is supposed to be clamped.
    sessionHandler.currentIndex = -1;
    expect(sessionHandler.currentIndex, 0);
    
    sessionHandler.currentIndex = 3;
    expect(sessionHandler.currentIndex, 2);
    
    // Closing a session is supposed to decrement the current index.
    sessionHandler.closeWidgetTestSession(2);
    expect(sessionHandler.widgetTestSessions.length, 2);
    expect(sessionHandler.currentIndex, 1);
    
    sessionHandler.closeWidgetTestSession(0);
    expect(sessionHandler.widgetTestSessions.length, 1);
    expect(sessionHandler.currentIndex, 0);
  });
}