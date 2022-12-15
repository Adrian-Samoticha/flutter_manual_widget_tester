import 'dart:async';

import 'package:flutter/widgets.dart';

class WidgetTestSessionGenericSettings {
  MediaQueryData _mediaQueryData = const MediaQueryData();
  final StreamController<WidgetTestSessionGenericSettings> _onChangedStream =
      StreamController.broadcast();

  MediaQueryData get mediaQueryData => _mediaQueryData;

  set mediaQueryData(MediaQueryData newMediaQueryData) {
    _mediaQueryData = newMediaQueryData;
    _onChangedStream.add(this);
  }

  StreamSubscription<WidgetTestSessionGenericSettings>
      registerOnChangedCallback(
          void Function(WidgetTestSessionGenericSettings) callback) {
    return _onChangedStream.stream.listen(callback);
  }
}
