import 'dart:convert';

class Post {
  final String id;
  final DateTime createdAt;
  final String postedBy;
  final String content;

  Post({
    required this.id,
    required this.createdAt,
    required this.postedBy,
    required this.content,
  });

  Post copyWith({
    String? id,
    DateTime? createdAt,
    String? postedBy,
    String? content,
  }) {
    return Post(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      postedBy: postedBy ?? this.postedBy,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'postedBy': postedBy,
      'content': content,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      postedBy: map['postedBy'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, createdAt: $createdAt, postedBy: $postedBy, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.postedBy == postedBy &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        postedBy.hashCode ^
        content.hashCode;
  }
}
