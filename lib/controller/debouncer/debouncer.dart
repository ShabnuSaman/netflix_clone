import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? timer;
  Debouncer({required this.delay});

  void call(Function() action) {
    timer?.cancel();
    timer = Timer(delay, action);
  }
}
