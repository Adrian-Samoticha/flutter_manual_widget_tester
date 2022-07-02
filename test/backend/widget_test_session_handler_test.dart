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
    
    // Closing a session is supposed to decrement the current index,
    // if the current index is greater than or equal to the closed index.
    sessionHandler.closeWidgetTestSession(2);
    expect(sessionHandler.widgetTestSessions.length, 2);
    expect(sessionHandler.currentIndex, 1);
    
    sessionHandler.closeWidgetTestSession(0);
    expect(sessionHandler.widgetTestSessions.length, 1);
    expect(sessionHandler.currentIndex, 0);
    
    // The index should, however, not be decremented if the current index,
    // is smaller than the closed index.
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    expect(sessionHandler.widgetTestSessions.length, 3);
    sessionHandler.currentIndex = 1;
    expect(sessionHandler.currentIndex, 1);
    sessionHandler.closeWidgetTestSession(2);
    expect(sessionHandler.currentIndex, 1);
  });
  
  testWidgets('widget test session handler session creation callback', (tester) async {
    final sessionHandler = WidgetTestSessionHandler();
    
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );
    
    sessionHandler.createNewSession(WidgetTestSession());
  });
  
  testWidgets('widget test session handler index change callback', (tester) async {
    final sessionHandler = WidgetTestSessionHandler();
    
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );
    
    sessionHandler.currentIndex = 1;
  });
  
  testWidgets('widget test session handler session closed callback (index does not change)', (tester) async {
    final sessionHandler = WidgetTestSessionHandler();
    
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    
    sessionHandler.currentIndex = 0;
    
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );
    
    sessionHandler.closeWidgetTestSession(0);
  });
  
  testWidgets('widget test session handler session closed callback (index does change)', (tester) async {
    final sessionHandler = WidgetTestSessionHandler();
    
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    sessionHandler.createNewSession(WidgetTestSession());
    
    sessionHandler.currentIndex = 2;
    
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );
    
    sessionHandler.closeWidgetTestSession(0);
  });
}