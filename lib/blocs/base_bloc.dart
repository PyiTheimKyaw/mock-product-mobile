import 'package:flutter/foundation.dart';

class BaseBloc extends ChangeNotifier {
  bool isDisposed = false;

  void notifySafely() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
