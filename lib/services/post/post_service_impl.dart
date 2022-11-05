import 'dart:convert';
import 'dart:io';

import 'package:planetx/models/post.dart';
import 'package:planetx/models/new_post_request.dart';
import 'package:planetx/services/commons.dart';
import 'package:planetx/services/post/post_service.dart';
import 'package:http/http.dart' as http;

class PostServiceImpl implements PostService {
  static PostServiceImpl? _instance;

  static PostServiceImpl get instance => _instance ?? PostServiceImpl._();

  PostServiceImpl._();

  final _hostUri = Uri.parse(endPoint[Services.posts]!);

  @override
  Future<Post> createPost(NewPostRequest request, String token) async {
    try {
      var response = await http.post(
        _hostUri,
        body: jsonEncode(request.toMap()),
        headers: {
          HttpHeaders.authorizationHeader: "Brearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      var post = Post.fromJson(response.body);

      return post;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPosts(String token) async {
    try {
      var response = await http.get(_hostUri);

      var data = jsonDecode(response.body) as List<dynamic>;

      var posts = data.map((e) => Post.fromMap(e)).toList();

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
