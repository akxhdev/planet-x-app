import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:planetx/models/post.dart';

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
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                IconButton(onPressed: null, icon: Icon(Icons.share)),
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
