import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchButtonNotifier extends StateNotifier<bool> {
  // false = left, true = right
  SwitchButtonNotifier() : super(false);

  void set(bool switchState) {
    state = switchState;
  }

  void reset() {
    state = false;
  }
}

final switchButtonFamily = StateNotifierProvider.autoDispose
    .family<SwitchButtonNotifier, bool, String>(
        (ref, name) => SwitchButtonNotifier());
