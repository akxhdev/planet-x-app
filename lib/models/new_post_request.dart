import 'dart:convert';

class NewPostRequest {
  final String postedBy;
  final String content;

  NewPostRequest({
    required this.postedBy,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {'postedBy': postedBy, 'content': content};
  }

  String toJson() => json.encode(toMap());
}
