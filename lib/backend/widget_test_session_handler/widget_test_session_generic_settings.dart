import 'dart:async';

import 'package:flutter/widgets.dart';

class WidgetTestSessionGenericSettings {
  MediaQueryData _mediaQueryData = const MediaQueryData();
  TextStyle _defaultTextStyle = const TextStyle();
  final StreamController<WidgetTestSessionGenericSettings> _onChangedStream =
      StreamController.broadcast();

  MediaQueryData get mediaQueryData => _mediaQueryData;
  TextStyle get defaultTextStyle => _defaultTextStyle;

  set mediaQueryData(MediaQueryData newMediaQueryData) {
    _mediaQueryData = newMediaQueryData;
    _onChangedStream.add(this);
  }

  set defaultTextStyle(TextStyle newTextStyle) {
    _defaultTextStyle = newTextStyle;
    _onChangedStream.add(this);
  }

  StreamSubscription<WidgetTestSessionGenericSettings>
      registerOnChangedCallback(
          void Function(WidgetTestSessionGenericSettings) callback) {
    return _onChangedStream.stream.listen(callback);
  }
}
