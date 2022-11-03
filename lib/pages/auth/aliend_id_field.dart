import 'package:flutter/material.dart';
import 'package:planetx/pages/auth/auth_page_provider.dart';
import 'package:planetx/pages/auth/field_container.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_form_field.dart';

class AlienIdField extends StatelessWidget {
  const AlienIdField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthPageProvider>(
      builder: (context, provider, child) {
        return FieldContainer(
          child: AuthFormField(
            onChnaged: (value) =>
                provider.onChangeField(AuthFormFields.alienId, value),
            label: "Alien Id",
            hint: "eg. imalien_ak",
            validator: (s) => null,
          ),
        );
      },
    );
  }
}
