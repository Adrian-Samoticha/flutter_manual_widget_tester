import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_settings.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/button_row.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/text_field.dart';
import 'package:sprintf/sprintf.dart';

import '../../ui_elements/heading.dart';
import 'infinite_scroll_view.dart';

class ManualWidgetTesterCustomSettingsDoubleEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsDoubleEditor({Key? key, required this.themeSettings, required this.settingName, required this.currentValue, required this.onChanged, required this.infiniteScrollViewRange, required this.infiniteScrollViewScrollSpeedFactor}) : super(key: key);

  final ManualWidgetTesterThemeSettings themeSettings;
  final String settingName;
  final double currentValue;
  final void Function(double) onChanged;
  final double infiniteScrollViewRange;
  final double infiniteScrollViewScrollSpeedFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: themeSettings.customSettingsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(themeSettings: themeSettings, settingName: settingName),
          Column(
            children: [
              SizedBox(
                height: themeSettings.stringEditorHeight,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Expanded(
                          child: _generateTextField(),
                        ),
                        SizedBox(width: themeSettings.spaceBetweenTextBoxesAndButtonRows),
                        _generateButtonRow(constraints),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(height: themeSettings.spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView),
              _generateInfiniteScrollView(),
            ],
          ),
        ],
      ),
    );
  }

  Listener _generateInfiniteScrollView() {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          GestureBinding.instance.pointerSignalResolver.register(event, (event) {
            final scrollDelta = (event as PointerScrollEvent).scrollDelta;
            final newValue = currentValue + (scrollDelta.dx + scrollDelta.dy) * infiniteScrollViewScrollSpeedFactor;
            onChanged(newValue);
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: themeSettings.doubleEditorInfiniteScrollViewHeight,
        padding: themeSettings.doubleEditorInfiniteScrollViewPadding,
        decoration: themeSettings.doubleEditorInfiniteScrollViewBoxDecoration,
        clipBehavior: Clip.hardEdge,
        child: InfiniteScrollView(
          themeSettings: themeSettings,
          currentValue: currentValue,
          infiniteScrollViewRange: infiniteScrollViewRange,
        ),
      ),
    );
  }

  ManualWidgetTesterTextField _generateTextField() {
    return ManualWidgetTesterTextField(
      initialValue: sprintf('%f', [currentValue]),
      onSubmitted: (String valueAsString) {
        final parsedValue = double.tryParse(valueAsString);
        onChanged(parsedValue ?? currentValue);
      },
      themeSettings: themeSettings,
      disableRoundedCornersOnRightSide: true,
    );
  }

  SizedBox _generateButtonRow(BoxConstraints constraints) {
    return SizedBox(
      width: min(themeSettings.defaultNumberEditorButtonRowWidth, constraints.maxWidth * 0.5),
      child: ManualWidgetTesterButtonRow(
        themeSettings: themeSettings,
        disableRoundedCornersOnLeftSide: true,
        buttons: [
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('-')),
            onButtonPressed: null,
            onButtonDown: () {
              onChanged(currentValue - 0.2);
            },
          ),
          ManualWidgetTesterButtonInfo(
            child: const Center(child: Text('+')),
            onButtonPressed: null,
            onButtonDown: () {
              onChanged(currentValue + 0.2);
            },
          ),
        ],
      ),
    );
  }
}

