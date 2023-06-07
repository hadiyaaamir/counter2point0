import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  const Btn(
      {super.key,
      required this.title,
      required this.onPressed,
      this.highlight = false});

  final String title;
  final Function() onPressed;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: highlight
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: highlight
              ? Theme.of(context).colorScheme.inversePrimary
              : Colors.black),
      child: Text(title),
    );
  }
}
