import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/backend/constrained_types/constrained_int.dart';
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
        id: 'some key',
        name: 'SomeName',
        icon: Icons.access_alarms_rounded,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.white);
          return Container(
            color: backgroundColor,
            child: const Text('foobar2'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'some other key',
        name: 'SomeOtherName',
        icon: Icons.kayaking,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.orange);
          return Container(
            color: backgroundColor,
            child: const Text('foobar6'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'list view',
        name: 'ListView',
        icon: Icons.list,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.white);
          final constrainedInt = settings
              .getSetting(
                  'constrainedInt',
                  ConstrainedInt(
                      lowerLimit: null, value: 0, upperLimit: null, divisor: 2))
              .value;

          return SafeArea(
            child: Container(
              color: backgroundColor,
              child: Text('list view $constrainedInt'),
            ),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'dialog generator',
        name: 'DialogGenerator',
        icon: Icons.window,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.blue);
          return Container(
            color: backgroundColor,
            child: const Text('dialog generator'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'string editor state',
        name: 'StringEditorState',
        icon: Icons.abc,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.lightGreen);
          return Container(
            color: backgroundColor,
            child: const Text('edit this string\'s state'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'substring editor',
        name: 'SubstringEditor',
        icon: Icons.abc,
        iconColor: Colors.red,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.green);
          return Container(
            color: backgroundColor,
            child: const Text('it this str'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'string editor',
        name: 'StringEditor',
        icon: Icons.abc,
        builder: (context, settings) {
          final backgroundColor =
              settings.getSetting('backgroundColor', Colors.green);
          return Container(
            color: backgroundColor,
            child: const Text('edit this string'),
          );
        },
      ),
      WidgetTestBuilder(
        id: 'offset button test',
        name: 'Offset Button Test',
        icon: Icons.smart_button,
        builder: (context, settings) {
          final offsetX = settings.getSetting('offsetX', 0.0);
          final offsetY = settings.getSetting('offsetY', 0.0);

          return Center(
            child: Container(
              color: const Color.fromRGBO(0, 0, 0, 0.25),
              child: SizedBox(
                width: 128.0,
                height: 32.0,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Transform.translate(
                    offset: Offset(offsetX * constraints.maxWidth,
                        offsetY * constraints.maxHeight),
                    child: ElevatedButton(
                      onPressed: () {
                        print('pressed');
                      },
                      child: const Text('button'),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    ];

    return ManualWidgetTester(
      themeSettings: const ManualWidgetTesterThemeSettings(),
      builders: builders,
    );
  }
}
