part of 'view.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final ThemeController themeController = ThemeController();

  @override
  void dispose() {
    super.dispose();
    themeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget<ThemeController>(
      listenable: themeController,
      child: ListenableBuilder(
        listenable: themeController,
        builder: (BuildContext context, Widget? child) {
          ThemeController themeController =
              CustomInheritedWidget.of<ThemeController>(context).listenable;

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
      ),
    );
  }
}
