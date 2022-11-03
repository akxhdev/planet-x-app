import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planetx/pages/base_page.dart';
import 'package:planetx/pages/new_post/new_post.dart';
import 'package:planetx/pages/new_post/new_post_page_provider.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:planetx/providers/post_provider.dart';
import 'package:planetx/services/authentication/auth_service_impl.dart';
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
        ChangeNotifierProvider(create: (context) {
          var authService = AuthServiceImpl();
          return AuthProvider(authService);
        }),
        ChangeNotifierProvider(
          create: (context) => PostProvider(PostServiceImpl()),
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
              return ChangeNotifierProvider(
                create: (context) => NewPostPageProvider(),
                child: const NewPost(),
              );
            },
          },
        ),
      ),
    );
  }
}
