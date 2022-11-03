import 'dart:convert';

class CreateAlienRequest {
  final String alienId;
  final String name;
  final String email;
  final String password;

  CreateAlienRequest({
    required this.alienId,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'alienId': alienId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory CreateAlienRequest.fromMap(Map<String, dynamic> map) {
    return CreateAlienRequest(
      alienId: map['alienId'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateAlienRequest.fromJson(String source) =>
      CreateAlienRequest.fromMap(json.decode(source));
}
