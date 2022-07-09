import 'dart:async';
import 'dart:collection';

class WidgetTestSessionCustomSettings {
  final Map<String, dynamic> _settingNameToValue = {};
  final StreamController<WidgetTestSessionCustomSettings> _onChangedStream = StreamController.broadcast();
  
  T getSetting<T>(String settingName, T initialValue) {
    _settingNameToValue[settingName] = _settingNameToValue[settingName] ?? initialValue;
    
    return _settingNameToValue[settingName] as T;
  }
  
  void setSetting<T>(String settingName, T newValue) {
    if (newValue.runtimeType != _settingNameToValue[settingName].runtimeType) {
      throw Exception('Attempting to overwrite setting “$settingName” which has type “${_settingNameToValue[settingName].runtimeType}” with a value of a different type “${newValue.runtimeType}”.');
    }
    
    _settingNameToValue[settingName] = newValue;
    
    _onChangedStream.add(this);
  }
  
  void removeSetting(String settingName) {
    _settingNameToValue.remove(settingName);
    
    _onChangedStream.add(this);
  }
  
  Map<String, dynamic> get settings => UnmodifiableMapView(_settingNameToValue);
  
  StreamSubscription registerOnChangedCallback(void Function(WidgetTestSessionCustomSettings) callback) {
    return _onChangedStream.stream.listen(callback);
  }
}