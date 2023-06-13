part of 'view.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        ThemeInherited.of(context).listenable;

    return IconButton(
      onPressed: () {
        themeController.toggleMode();
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: themeController.theme.isDarkMode
            ? const Icon(key: Key('1'), Icons.light_mode)
            : const Icon(key: Key('2'), Icons.dark_mode),
      ),
    );
  }
}