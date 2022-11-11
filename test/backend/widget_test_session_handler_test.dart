import 'package:flutter/widgets.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_session_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test session handler basic functionality',
      (tester) async {
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
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, name: '0', builder: (_, __) => Container()));
    expect(sessionHandler.currentIndex, 0);
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, name: '1', builder: (_, __) => Container()));
    expect(sessionHandler.currentIndex, 1);
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 2, name: '2', builder: (_, __) => Container()));
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
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, builder: (_, __) => Container()));
    expect(sessionHandler.widgetTestSessions.length, 3);
    sessionHandler.currentIndex = 1;
    expect(sessionHandler.currentIndex, 1);
    sessionHandler.closeWidgetTestSession(2);
    expect(sessionHandler.currentIndex, 1);
  });

  testWidgets(
      'widget test session handler throw when closing non-existent session',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    expect(() => sessionHandler.closeWidgetTestSession(0), throwsArgumentError);
  });

  testWidgets('widget test session handler session creation callback',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
  });

  testWidgets('widget test session handler index change callback',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 2, builder: (_, __) => Container()));

    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );

    sessionHandler.currentIndex = 1;
  });

  testWidgets(
      'widget test session handler session closed callback (index does not change)',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 2, builder: (_, __) => Container()));

    sessionHandler.currentIndex = 0;

    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );

    sessionHandler.closeWidgetTestSession(0);
  });

  testWidgets(
      'widget test session handler session closed callback (index does change)',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 2, builder: (_, __) => Container()));

    sessionHandler.currentIndex = 2;

    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler),
    );

    sessionHandler.closeWidgetTestSession(0);
  });

  testWidgets(
      'widget test session handler session custom settings stream subscriptions',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));

    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler, count: 1),
    );

    sessionHandler.widgetTestSessions[0].customSettings
        .setSetting('someSetting', 'new value');
  });

  testWidgets(
      'widget test session handler session custom settings stream subscriptions (session is closed)',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));

    final settingsToBeChangedLater =
        sessionHandler.widgetTestSessions[0].customSettings;

    sessionHandler.closeWidgetTestSession(0);

    // The stream subscription should be cancelled when the session is closed, therefore
    // the count is 0.
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler, count: 0),
    );

    settingsToBeChangedLater.setSetting('someSetting', 'new value');
  });

  testWidgets(
      'widget test session handler session custom settings stream subscriptions (three sessions, first two are closed, the second one is modified)',
      (tester) async {
    final sessionHandler = WidgetTestSessionHandler();

    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 0, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 1, builder: (_, __) => Container()));
    sessionHandler.createNewSession(
        WidgetTestBuilder(id: 2, builder: (_, __) => Container()));

    final settings = [
      sessionHandler.widgetTestSessions[0].customSettings,
      sessionHandler.widgetTestSessions[1].customSettings,
      sessionHandler.widgetTestSessions[2].customSettings,
    ];

    sessionHandler.closeWidgetTestSession(0);
    sessionHandler.closeWidgetTestSession(0);

    // The stream subscription should be cancelled when the session is closed, therefore
    // the count is 0.
    sessionHandler.registerOnChangedCallback(
      expectAsync1((value) => value == sessionHandler, count: 0),
    );

    settings[1].setSetting('someSetting', 'new value');
  });
}
