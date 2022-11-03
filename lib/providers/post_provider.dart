import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:planetx/services/post/post_service.dart';

import '../models/new_post_request.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
  final PostService _postService;
  final _postsStreamController = StreamController<List<Post>>.broadcast();
  var _posts = <Post>[];
  var _initLoading = true;

  PostProvider(this._postService);

  StreamSink<List<Post>> get _postsSink => _postsStreamController.sink;
  Stream<List<Post>> get postsStream => _postsStreamController.stream;

  Future<void> loadData(String token) async {
    if (!_initLoading) {
      return Future.delayed(
          const Duration(milliseconds: 400), () => _postsSink.add(_posts));
    }

    final posts = await _postService.getPosts(token);
    _posts = posts;
    _postsSink.add(_posts);

    _initLoading = false;
  }

  Future<void> refresh(String token) {
    _initLoading = true;
    return loadData(token);
  }

  Future<void> createPost(NewPostRequest request, String token) async {
    final post = await _postService.createPost(request, token);
    _posts.insert(0, post);

    _postsSink.add(_posts);
  }

  @override
  void dispose() {
    _postsStreamController.close();
    super.dispose();
  }
}
