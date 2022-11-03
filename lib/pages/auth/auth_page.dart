import 'package:flutter/material.dart';
import 'package:planetx/pages/auth/aliend_id_field.dart';
import 'package:planetx/pages/auth/email_field.dart';
import 'package:planetx/pages/auth/hello_alien_text.dart';
import 'package:planetx/pages/auth/name_field.dart';
import 'package:planetx/pages/auth/password_field.dart';
import 'package:planetx/pages/auth/submit_button.dart';
import 'package:planetx/pages/auth/switch_form_button.dart';
import 'package:planetx/pages/auth/welcome_text.dart';
import 'package:provider/provider.dart';

import 'auth_page_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const route = "/login";

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthPageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HelloAlienText(),
                    const WelcomeText(),
                    const AlienIdField(),
                    if (!provider.isLoginForm) const NameField(),
                    if (!provider.isLoginForm) const EmailField(),
                    const PasswordField(),
                    const SubmitButton(),
                    const SwitchFormButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
