import 'package:flutter/widgets.dart';
import 'package:flutter_manual_widget_tester/backend/type_editor_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('type editor builder basic functionality', (tester) async {
    final editorBuilder = TypeEditorBuilder();
    
    expect(editorBuilder.hasEditorBuilderInstalledForType(String), false);
    
    editorBuilder.installEditorBuilder<String>(
      (String settingName, String text, void Function(String) onValueChanged) {
        onValueChanged('new string');
        
        return Container();
      }
    );
    
    expect(editorBuilder.hasEditorBuilderInstalledForType(String), true);
    
    editorBuilder.buildEditor('some setting', String, 'some value', expectAsync1((value) => value == 'new string'));
  });
  
  testWidgets('type editor builder exception when attempting to build non-existant editor builder', (tester) async {
    final editorBuilder = TypeEditorBuilder();
    
    expect(() => editorBuilder.buildEditor('some setting', double, 0.0, (_) { }), throwsArgumentError);
  });
}