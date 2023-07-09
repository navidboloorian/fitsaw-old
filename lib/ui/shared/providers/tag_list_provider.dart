import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagListNotifier extends StateNotifier<List<String>> {
  TagListNotifier() : super([]);

  void add(String tag) {
    state = [...state, tag];
  }

  void remove(String tag) {
    state.remove(tag);
    state = state;
  }

  void set(List<String> tags) {
    state = tags;
  }

  void reset() {
    state = [];
  }
}

final tagListProvider =
    StateNotifierProvider.autoDispose<TagListNotifier, List<String>>(
        (ref) => TagListNotifier());
