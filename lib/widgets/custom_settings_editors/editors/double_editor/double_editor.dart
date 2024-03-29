import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/custom_settings_editors/ui_elements/heading.dart';

import 'button_row_with_constraints.dart';
import 'double_editor_text_field.dart';
import 'themed_interactive_infinite_scroll_view/themed_interactive_infinite_scroll_view.dart';

class ManualWidgetTesterCustomSettingsDoubleEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsDoubleEditor({
    super.key,
    required this.settingName,
    required this.currentValue,
    required this.onChanged,
    this.lowerLimit = double.negativeInfinity,
    this.upperLimit = double.infinity,
  });

  final String settingName;
  final double currentValue;
  final void Function(double) onChanged;
  final double lowerLimit;
  final double upperLimit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ManualWidgetTesterTheme.of(context).customSettingsTheme.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ManualWidgetTesterCustomSettingsHeading(
            settingName: settingName,
          ),
          Column(
            children: [
              SizedBox(
                height: ManualWidgetTesterTheme.of(context)
                    .stringEditorTheme
                    .height,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Expanded(
                          child: DoubleEditorTextField(
                            currentValue: currentValue,
                            onChanged: onChanged,
                          ),
                        ),
                        SizedBox(
                          width: ManualWidgetTesterTheme.of(context)
                              .generalTheme
                              .spaceBetweenTextBoxesAndButtonRows,
                        ),
                        ButtonRowWithConstraints(
                          constraints: constraints,
                          currentValue: currentValue,
                          lowerLimit: lowerLimit,
                          upperLimit: upperLimit,
                          onChanged: onChanged,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: ManualWidgetTesterTheme.of(context)
                    .doubleEditorTheme
                    .spaceBetweenTextFieldAndDoubleEditorInfiniteScrollView,
              ),
              ThemedInteractiveInfiniteScrollView(
                currentValue: currentValue,
                onChanged: onChanged,
                lowerLimit: lowerLimit,
                upperLimit: upperLimit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
