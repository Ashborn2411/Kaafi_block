import 'package:flutter/material.dart';
import '../controller/controller.dart';

class LongPressFAB extends StatefulWidget {
  const LongPressFAB({super.key});

  @override
  State<LongPressFAB> createState() => _LongPressFABState();
}

class _LongPressFABState extends State<LongPressFAB> {
  final LongPressFABController _controller = LongPressFABController();

  void _startTimer() {
    _controller.isPressed = true;
    _controller.startTimer(() {
      if (mounted) setState(() {});
    });
  }

  void _cancelTimer() {
    _controller.cancelTimer();
    _controller.isPressed = false;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _startTimer();
      },
      onLongPressEnd: (details) {
        _cancelTimer();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4.0),
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey[700],
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.fingerprint, size: 42),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent, width: 6.0),
              ),
              child: CircularProgressIndicator(
                value: _controller.progressValue,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.transparent,
                strokeWidth: 6.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
