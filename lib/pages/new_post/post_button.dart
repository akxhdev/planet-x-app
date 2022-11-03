import 'package:flutter/material.dart';
import 'package:planetx/pages/new_post/post_button_provider.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:planetx/providers/post_provider.dart';
import 'package:planetx/widgets/loading_spinner.dart';
import 'package:provider/provider.dart';

import 'new_post_page_provider.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostButtonProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const FloatingActionButton.small(
            onPressed: null,
            child: LoadingSpinner(),
          );
        }

        return FloatingActionButton.extended(
          onPressed: () async {
            // show loading spinner
            provider.startLoading();

            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);

            final newPostPageProvider =
                Provider.of<NewPostPageProvider>(context, listen: false);

            final postProvider =
                Provider.of<PostProvider>(context, listen: false);

            var navigator = Navigator.of(context);

            final alienId = authProvider.alien!.alienId;
            final token = authProvider.alien!.token;

            final createPostRequest =
                newPostPageProvider.generatePostRequest(alienId);

            if (createPostRequest == null) {
              return;
            }

            await postProvider.createPost(createPostRequest, token);

            // hide loading spinner
            provider.stopLoading();

            // pop out NewPost page
            navigator.pop();
          },
          icon: const Icon(Icons.send),
          label: const Text("Post"),
        );
      },
    );
  }
}
