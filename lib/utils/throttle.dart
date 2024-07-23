import 'dart:async';

class Throttle {
  final Duration duration;

  Throttle({required this.duration});

  bool _waiting = false;
  Timer? _timer;

  void run(void Function() action) {
    if (_waiting) return;

    _waiting = true;

    action();

    _timer = Timer(
      duration,
      () => _waiting = false,
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}
