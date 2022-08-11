import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_session_handler/widget_test_builder.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/flutter_manual_widget_tester.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final builders = [
      WidgetTestBuilder(
        key: const ValueKey('some key'),
        name: 'SomeName',
        icon: Icons.access_alarms_rounded,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.white);
          return Container(
            color: backgroundColor,
            child: const Text('foobar2'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('some other key'),
        name: 'SomeOtherName',
        icon: Icons.kayaking,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.orange);
          return Container(
            color: backgroundColor,
            child: const Text('foobar6'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('list view'),
        name: 'ListView',
        icon: Icons.list,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.white);
          return Container(
            color: backgroundColor,
            child: const Text('list view'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('dialog generator'),
        name: 'DialogGenerator',
        icon: Icons.window,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.blue);
          return Container(
            color: backgroundColor,
            child: const Text('dialog generator'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('string editor state'),
        name: 'StringEditorState',
        icon: Icons.abc,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.lightGreen);
          return Container(
            color: backgroundColor,
            child: const Text('edit this string\'s state'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('substring editor'),
        name: 'SubstringEditor',
        icon: Icons.abc,
        iconColor: Colors.red,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.green);
          return Container(
            color: backgroundColor,
            child: const Text('it this str'),
          );
        },
      ),
      WidgetTestBuilder(
        key: const ValueKey('string editor'),
        name: 'StringEditor',
        icon: Icons.abc,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.green);
          return Container(
            color: backgroundColor,
            child: const Text('edit this string'),
          );
        },
      ),
    ];
    
    return ManualWidgetTester(
      themeSettings: const ManualWidgetTesterThemeSettings(
        
      ),
      builders: builders,
    );
  }
}
