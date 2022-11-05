import 'package:flutter/material.dart';
import 'package:planetx/models/post.dart';

import 'feed_list_view_item.dart';

class FeedListView extends StatelessWidget {
  const FeedListView({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 18),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => FeedListViewItem(post: posts[index]),
      itemCount: posts.length,
    );
  }
}
