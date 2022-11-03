import 'dart:convert';

class LoggedInAlien {
  final String alienId;
  final String token;

  LoggedInAlien({
    required this.alienId,
    required this.token,
  });

  LoggedInAlien copyWith({
    String? alienId,
    String? token,
  }) {
    return LoggedInAlien(
      alienId: alienId ?? this.alienId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alienId': alienId,
      'token': token,
    };
  }

  factory LoggedInAlien.fromMap(Map<String, dynamic> map) {
    return LoggedInAlien(
      alienId: map['alienId'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedInAlien.fromJson(String source) =>
      LoggedInAlien.fromMap(json.decode(source));

  @override
  String toString() => 'LoggedInAlien(alienId: $alienId, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoggedInAlien &&
        other.alienId == alienId &&
        other.token == token;
  }

  @override
  int get hashCode => alienId.hashCode ^ token.hashCode;
}
