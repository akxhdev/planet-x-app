import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    Key? key,
    this.value,
  }) : super(key: key);

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          value: value,
        ),
      ),
    );
  }
}
