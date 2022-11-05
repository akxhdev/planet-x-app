import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planetx/pages/base_page.dart';
import 'package:planetx/pages/new_post/new_post.dart';
import 'package:planetx/pages/new_post/new_post_page_provider.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:planetx/providers/image_upload_provider.dart';
import 'package:planetx/providers/post_provider.dart';
import 'package:planetx/services/authentication/auth_service_impl.dart';
import 'package:planetx/services/image_upload/image_upload_service.dart';
import 'package:planetx/services/image_upload/image_upload_service_impl.dart';
import 'package:provider/provider.dart';

import 'services/post/post_service_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(authService: AuthServiceImpl.instance),
        ),
        ChangeNotifierProxyProvider<AuthProvider, PostProvider>(
          create: (context) => PostProvider(
            token: Provider.of<AuthProvider>(context, listen: false).token,
            postService: PostServiceImpl.instance,
          ),
          update: (_, authProvider, previous) {
            return PostProvider(
              postService: previous?.postService ?? PostServiceImpl.instance,
              token: previous?.token ?? authProvider.token,
              posts: previous?.posts ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<AuthProvider, ImageUploadProvider>(
          create: (context) => ImageUploadProvider(
            imageUploadService: ImageUploadServiceImpl.instance,
            token: Provider.of<AuthProvider>(context, listen: false).token,
          ),
          update: (context, authProvider, previous) {
            return ImageUploadProvider(
              imageUploadService: previous?.imageUploadService ??
                  ImageUploadServiceImpl.instance,
              token: previous?.token ?? authProvider.token,
            );
          },
        ),
      ],
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) => MaterialApp(
          title: "Planet-X",
          themeMode: ThemeMode.dark,
          theme: ThemeData(colorScheme: lightColorScheme),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            scaffoldBackgroundColor: Colors.black,
            textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
            useMaterial3: true,
          ),
          home: const BasePage(),
          routes: {
            NewPost.routeName: (context) {
              return ChangeNotifierProxyProvider3<AuthProvider, PostProvider,
                  ImageUploadProvider, NewPostPageProvider>(
                create: (context) => NewPostPageProvider(
                  alienId:
                      Provider.of<AuthProvider>(context, listen: false).alienId,
                  formData: {
                    NewPostForm.content: "",
                    NewPostForm.image: null,
                  },
                  formKey: GlobalKey<FormState>(),
                ),
                update: (_, authProvider, postProvider, imageUploadProvider,
                    previous) {
                  return NewPostPageProvider(
                    alienId: authProvider.alienId,
                    createPost: postProvider.createPost,
                    formData: previous?.formData ??
                        {
                          NewPostForm.content: "",
                          NewPostForm.image: null,
                        },
                    formKey: previous?.formKey ?? GlobalKey<FormState>(),
                    uploadImage: imageUploadProvider.uploadImage,
                  );
                },
                child: const NewPost(),
              );
            },
          },
        ),
      ),
    );
  }
}
