import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  Timer? _timer;

  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 500), callback);
  }
}
