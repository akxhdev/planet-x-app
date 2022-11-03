import 'package:flutter/cupertino.dart';
import 'package:planetx/models/auth_request.dart';

class AuthPageProvider with ChangeNotifier {
  final _formData = {
    AuthFormFields.alienId: "",
    AuthFormFields.name: "",
    AuthFormFields.email: "",
    AuthFormFields.password: ""
  };

  bool _isLoginForm = true;

  bool get isLoginForm => _isLoginForm;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void onChangeField(AuthFormFields field, String value) {
    _formData[field] = value;
    notifyListeners();
  }

  void switchForm() {
    _isLoginForm = !_isLoginForm;
    notifyListeners();
  }

  AuthRequest? generateAuthRequest() {
    var formState = formKey.currentState;

    if (formState != null) {
      var isValid = formState.validate();

      if (isValid) {
        return AuthRequest(
          _formData[AuthFormFields.alienId]!,
          _formData[AuthFormFields.password]!,
        );
      }
    }

    return null;
  }

  void generateCreateAlienRequest() {}
}

enum AuthFormFields { alienId, name, email, password }
