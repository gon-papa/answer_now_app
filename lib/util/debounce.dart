import 'dart:async';
import 'package:answer_now_app/importer.dart';

part 'debounce.g.dart';

@riverpod
class Debounce extends _$Debounce {
  @override
  Timer? build() {
    ref.onDispose(() {
      state?.cancel();
    });

    return null;
  }

  void run(Function() action, int milliseconds) {
    if (state?.isActive ?? false) state?.cancel();
    state = Timer(Duration(milliseconds: milliseconds), () {
      action();
    });
  }
}
