part of 'view.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  // ThemeController();

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        ThemeInherited.of(context).listenable;

    return IconButton(
      onPressed: () {
        themeController.toggleMode();
      },
      icon:
          // ListenableBuilder(
          //     listenable: themeController,
          //     builder: (BuildContext context, Widget? child) {
          // return
          AnimatedSwitcher(
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
        child: themeController.isDarkMode
            ? const Icon(key: Key('1'), Icons.light_mode)
            : const Icon(key: Key('2'), Icons.dark_mode),
        //   );
        // }
      ),
    );
  }
}
