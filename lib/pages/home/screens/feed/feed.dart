import 'package:flutter/material.dart';
import 'package:planetx/pages/home/screens/feed/feel_list_view.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:planetx/providers/post_provider.dart';
import 'package:planetx/widgets/error_text.dart';
import 'package:planetx/widgets/loading_spinner.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token =
        Provider.of<AuthProvider>(context, listen: false).alien!.token;

    var postRepository = Provider.of<PostProvider>(context, listen: false);

    postRepository.loadData(token);

    return StreamBuilder(
      stream: postRepository.postsStream,
      builder: (context, snapshot) {
        // data loaded --> show feeds list
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: () => postRepository.refresh(token),
            child: FeedListView(posts: snapshot.data!),
          );
        }

        // error occurred --> show error message
        if (snapshot.hasError) {
          return const ErrorText(errorMessage: "Unable to fetch feeds");
        }

        // fetching data --> loading spinner
        return const LoadingSpinner();
      },
    );
  }
}
