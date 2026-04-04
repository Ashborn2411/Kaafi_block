import 'dart:async';
import 'package:flutter/foundation.dart';

class LongPressFABController {
  bool isPressed = false;
  double progressValue = 0.0;
  Timer? _timer;
  final VoidCallback? onExecute;

  LongPressFABController({this.onExecute});

  void startTimer(VoidCallback onProgress) {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      progressValue += 0.05;
      onProgress();
      if (progressValue >= 1.0) {
        executeFunction();
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
    progressValue = 0.0;
  }

  void executeFunction() {
    onExecute?.call();
  }

  void dispose() {
    _timer?.cancel();
  }
}
