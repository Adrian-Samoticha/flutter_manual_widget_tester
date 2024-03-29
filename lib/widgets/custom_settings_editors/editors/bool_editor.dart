import 'package:flutter/material.dart';
import 'package:flutter_manual_widget_tester/config/theme_config/theme.dart';
import 'package:flutter_manual_widget_tester/widgets/ui_elements/radio_button.dart';

import '../ui_elements/heading.dart';

class ManualWidgetTesterCustomSettingsBoolEditor extends StatelessWidget {
  const ManualWidgetTesterCustomSettingsBoolEditor({
    super.key,
    required this.settingName,
    required this.currentValue,
    required this.onChanged,
  });

  final String settingName;
  final bool currentValue;
  final void Function(bool) onChanged;

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
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: ManualWidgetTesterTheme.of(context)
                    .boolEditorTheme
                    .maxWidth,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _RadioButtonWithLabel(
                      isTrue: true,
                      currentValue: currentValue,
                      onChanged: onChanged,
                    ),
                  ),
                  SizedBox(
                    width: ManualWidgetTesterTheme.of(context)
                        .boolEditorTheme
                        .spaceBetweenRadioButtons,
                  ),
                  Expanded(
                    child: _RadioButtonWithLabel(
                      isTrue: false,
                      currentValue: currentValue,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioButtonWithLabel extends StatelessWidget {
  const _RadioButtonWithLabel({
    required this.isTrue,
    required this.currentValue,
    required this.onChanged,
  });

  final bool isTrue;
  final bool currentValue;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          isTrue != currentValue ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapDown: (_) => onChanged(isTrue),
        child: Container(
          padding: ManualWidgetTesterTheme.of(context)
              .boolEditorTheme
              .radioButtonPadding,
          color: Colors.transparent,
          child: SizedBox(
            height: ManualWidgetTesterTheme.of(context)
                .boolEditorTheme
                .editorHeight,
            child: ManualWidgetTesterRadioButtonWithLabel(
              isSelected: isTrue ? currentValue : !currentValue,
              label: '$isTrue',
            ),
          ),
        ),
      ),
    );
  }
}
