import 'dart:convert';

class UpdateAlienRequest {
  final String name;
  final String password;

  UpdateAlienRequest({
    required this.name,
    required this.password,
  });

  UpdateAlienRequest copyWith({
    String? name,
    String? password,
  }) {
    return UpdateAlienRequest(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
    };
  }

  factory UpdateAlienRequest.fromMap(Map<String, dynamic> map) {
    return UpdateAlienRequest(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateAlienRequest.fromJson(String source) =>
      UpdateAlienRequest.fromMap(json.decode(source));

  @override
  String toString() => 'AlienUpdateRequest(name: $name, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateAlienRequest &&
        other.name == name &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
