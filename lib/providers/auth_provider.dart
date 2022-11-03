import 'package:flutter/foundation.dart';
import 'package:planetx/models/auth_request.dart';
import 'package:planetx/models/logged_in_alien.dart';

import '../services/authentication/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authenticationService;
  LoggedInAlien? _alien = LoggedInAlien(
    alienId: "akxhdev",
    token:
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJha3hoZGV2IiwiaWF0IjoxNjY2NzYwOTU3LCJleHAiOjE2NjY3OTY5NTd9.6qgh0Vu5eX4tPGGDXg59zEP7otmcnc46rETht8sHMGI",
  );

  AuthProvider(this._authenticationService);

  LoggedInAlien? get alien => _alien;

  void login(String alienId, String password) async {
    var request = AuthRequest(alienId, password);

    var authResponse = await _authenticationService.authenticate(request);

    _alien = LoggedInAlien(alienId: alienId, token: authResponse.token);

    notifyListeners();
  }

  void logout() {
    _alien = null;
    notifyListeners();
  }
}
