import 'package:planetx/models/new_post_request.dart';
import 'package:planetx/models/post.dart';

abstract class PostService {
  Future<List<Post>> getPosts(String token);
  Future<Post> createPost(NewPostRequest request, String token);
}
