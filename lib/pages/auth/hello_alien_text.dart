import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloAlienText extends StatelessWidget {
  const HelloAlienText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Hello, \nAlien",
        style: GoogleFonts.robotoMono(
          textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
