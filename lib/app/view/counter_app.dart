part of 'view.dart';

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  final ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return ListenableInherited<ThemeController>(
      controller: themeController,
      childBuilder: (themeController) {
        return MaterialApp(
          title: 'Counter 2.0',
          themeMode: themeController.themeMode,
          home: AnimatedTheme(
            data: themeController.theme.themeData,
            duration: const Duration(milliseconds: 500),
            child: const CounterScreen(),
          ),
        );
      },
    );
  }
}
