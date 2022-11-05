import 'package:flutter/material.dart';

class NewPostFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final String? Function(String?)? validator;

  final void Function(String)? onChnaged;

  const NewPostFormField({
    Key? key,
    this.label,
    this.hint,
    this.initialValue,
    this.validator,
    this.onChnaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: label,
        hintText: hint,
      ),
      minLines: 5,
      maxLines: 8,
      maxLength: 200,
      onChanged: onChnaged,
      validator: validator,
    );
  }
}
