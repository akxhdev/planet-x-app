import 'package:flutter/material.dart';
import 'package:planetx/pages/auth/auth_page_provider.dart';
import 'package:planetx/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Consumer<AuthPageProvider>(
        builder: (context, provider, child) => ElevatedButton(
          onPressed: () {
            if (provider.isLoginForm) {
              var authRequest = provider.generateAuthRequest();

              if (authRequest != null) {
                Provider.of<AuthProvider>(context, listen: false)
                    .login(authRequest.alienId, authRequest.password);
              }

              return;
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          child: Text(provider.isLoginForm ? "Login" : "Sign Up"),
        ),
      ),
    );
  }
}
