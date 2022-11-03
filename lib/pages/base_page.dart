import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:planetx/pages/auth/auth_page.dart';
import 'package:planetx/pages/auth/auth_page_provider.dart';
import 'package:planetx/pages/home/home_page.dart';
import 'package:planetx/pages/home/home_page_provider.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:planetx/providers/post_provider.dart';
import 'package:planetx/services/post/post_service_impl.dart';
import 'package:provider/provider.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      var alien = provider.alien;

      if (alien != null) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomePageProvider()),
          ],
          child: const HomePage(),
        );
      }

      return ChangeNotifierProvider(
        create: (context) => AuthPageProvider(),
        child: const AuthPage(),
      );
    });
  }
}
