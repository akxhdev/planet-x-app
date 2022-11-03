import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_page_provider.dart';

class SwitchFormButton extends StatelessWidget {
  const SwitchFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Consumer<AuthPageProvider>(
        builder: (context, provider, child) => TextButton(
          onPressed: provider.switchForm,
          child: Text(
            provider.isLoginForm
                ? "or Create new account"
                : "or Login in existing account",
          ),
        ),
      ),
    );
  }
}
