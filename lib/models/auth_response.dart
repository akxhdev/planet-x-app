import 'dart:convert';

class AuthResponse {
  final String token;

  AuthResponse(this.token);

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));
}
