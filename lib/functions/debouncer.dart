import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  late final int? milliseconds;

  late VoidCallback action;
  late Timer _timer;

  Debouncer({this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds ?? 0), action);
  }
}
