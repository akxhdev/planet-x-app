import 'package:flutter/material.dart';
import 'package:planetx/pages/new_post/new_post_page_provider.dart';
import 'package:planetx/pages/new_post/post_button.dart';
import 'package:planetx/pages/new_post/post_button_provider.dart';
import 'package:planetx/widgets/new_post_form_field.dart';
import 'package:provider/provider.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  static const routeName = '/new-post';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
      ),
      body: Consumer<NewPostPageProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: provider.formKey,
              child: ListView(
                children: [
                  NewPostFormField(
                    hint: "Content goes here...",
                    onChnaged: (value) =>
                        provider.onChangeField(NewPostForm.content, value),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: ChangeNotifierProvider(
        create: (context) => PostButtonProvider(),
        child: const PostButton(),
      ),
    );
  }
}
