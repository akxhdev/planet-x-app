import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;

  final bool obscureText;

  final void Function(String)? onChnaged;

  const AuthFormField({
    Key? key,
    this.label,
    this.hint,
    this.validator,
    this.obscureText = false,
    this.onChnaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: label,
        hintText: hint,
      ),
      onChanged: onChnaged,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
