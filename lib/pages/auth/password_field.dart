import 'package:flutter/material.dart';
import 'package:planetx/pages/auth/field_container.dart';
import 'package:planetx/widgets/auth_form_field.dart';
import 'package:provider/provider.dart';

import 'auth_page_provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthPageProvider>(
      builder: (context, provider, child) {
        return FieldContainer(
          child: AuthFormField(
            onChnaged: (value) =>
                provider.onChangeField(AuthFormFields.password, value),
            label: "Password",
            hint: "eg. your secret",
            obscureText: true,
            validator: (s) => null,
          ),
        );
      },
    );
  }
}
