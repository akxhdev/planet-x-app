import 'package:flutter/material.dart';

class PostButtonProvider with ChangeNotifier {
  final Future<void> Function() _onPressed;
  var _isLoading = false;

  PostButtonProvider({required Future<void> Function() onPressed})
      : _onPressed = onPressed;

  bool get isLoading => _isLoading;

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void onPressed() async {
    // show loading spinner
    startLoading();

    await _onPressed();

    // hide loading spinner
    stopLoading();
  }
}
