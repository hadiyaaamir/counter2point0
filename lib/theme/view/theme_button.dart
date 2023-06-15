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
    final CounterController counterController =
        CounterInherited.of(context).listenable;

    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          onPressed: () {
            themeController.toggleMode(counterController.counter.counter);
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
                ? const Icon(key: Key('light mode'), Icons.light_mode)
                : const Icon(key: Key('dark mode'), Icons.dark_mode),
          ),
        );
      },
    );
  }
}
