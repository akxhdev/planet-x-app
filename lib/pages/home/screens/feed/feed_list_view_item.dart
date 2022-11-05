import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:planetx/models/post.dart';
import 'package:planetx/widgets/error_text.dart';
import 'package:planetx/widgets/loading_spinner.dart';

class FeedListViewItem extends StatelessWidget {
  const FeedListViewItem({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.imageUrl != null && (post.imageUrl!.startsWith("http")))
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl!,
                    progressIndicatorBuilder: (context, url, progress) =>
                        LoadingSpinner(value: progress.progress),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ListTile(
            title: Text(post.content),
            subtitle: Text(
              post.postedBy,
              style: GoogleFonts.robotoMono(
                textStyle: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              post.createdAt.difference(DateTime.now()).inHours < 24
                  ? DateFormat.MMMEd().format(post.createdAt)
                  : DateFormat("MMMM dd").format(post.createdAt),
              style: GoogleFonts.robotoMono(
                textStyle: Theme.of(context).textTheme.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}
