import 'dart:convert';

class AuthRequest {
  final String alienId;
  final String password;

  AuthRequest(
    this.alienId,
    this.password,
  );

  Map<String, dynamic> toMap() {
    return {
      'alienId': alienId,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
