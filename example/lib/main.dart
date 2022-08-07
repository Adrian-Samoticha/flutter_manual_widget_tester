import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/widget_test_builder.dart';
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
        name: 'some name',
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
        name: 'some other name',
        icon: Icons.kayaking,
        builder: (context, settings) {
          final backgroundColor = settings.getSetting('backgroundColor', Colors.orange);
          return Container(
            color: backgroundColor,
            child: const Text('foobar6'),
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
