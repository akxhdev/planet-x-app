import 'dart:convert';

class Alien {
  final String alienId;
  final String name;
  final String email;

  Alien({
    required this.alienId,
    required this.name,
    required this.email,
  });

  Alien copyWith({
    String? alienId,
    String? name,
    String? email,
  }) {
    return Alien(
      alienId: alienId ?? this.alienId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alienId': alienId,
      'name': name,
      'email': email,
    };
  }

  factory Alien.fromMap(Map<String, dynamic> map) {
    return Alien(
      alienId: map['alienId'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Alien.fromJson(String source) => Alien.fromMap(json.decode(source));

  @override
  String toString() => 'Alien(alienId: $alienId, name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Alien &&
        other.alienId == alienId &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => alienId.hashCode ^ name.hashCode ^ email.hashCode;
}
