import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class NewPostRequest {
  final String postedBy;
  final String content;
  final String? imageUrl;

  NewPostRequest({
    required this.postedBy,
    required this.content,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'postedBy': postedBy,
      'content': content,
      'imageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  NewPostRequest copyWith({
    String? postedBy,
    String? content,
    String? imageUrl,
  }) {
    return NewPostRequest(
      postedBy: postedBy ?? this.postedBy,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
