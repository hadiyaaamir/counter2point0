import 'package:counter2point0/theme/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModeButton extends StatefulWidget {
  const ModeButton({super.key});

  @override
  State<ModeButton> createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  bool isDarkMode(context) => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeController>().toggleMode(),
      icon: Icon(isDarkMode(context) ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
