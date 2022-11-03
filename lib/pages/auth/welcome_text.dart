import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Register yourself in this planet",
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
