part of 'view.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isDarkMode(context) => Theme.of(context).brightness == Brightness.dark;
  final ThemeController themeController = ThemeController();

  @override
  void initState() {
    themeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        themeController.toggleMode();
      },
      icon: Icon(isDarkMode(context) ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
