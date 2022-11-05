import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:planetx/services/post/post_service.dart';

import '../models/new_post_request.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
  final PostService postService;
  final String token;
  List<Post> posts;

  final _postsStreamController = StreamController<List<Post>>.broadcast();

  var _initLoading = true;

  PostProvider({
    required this.postService,
    required this.token,
    this.posts = const [],
  });

  StreamSink<List<Post>> get _postsSink => _postsStreamController.sink;
  Stream<List<Post>> get postsStream => _postsStreamController.stream;

  Future<void> loadData() async {
    if (!_initLoading) {
      return Future.delayed(
          const Duration(milliseconds: 400), () => _postsSink.add(posts));
    }

    final changes = await postService.getPosts(token);
    posts = changes;
    _postsSink.add(changes);

    _initLoading = false;
  }

  Future<void> refresh() {
    _initLoading = true;
    return loadData();
  }

  Future<void> createPost(NewPostRequest request) async {
    final post = await postService.createPost(request, token);

    posts.insert(0, post);

    _postsSink.add(posts);
  }

  @override
  void dispose() {
    _postsStreamController.close();
    super.dispose();
  }
}
