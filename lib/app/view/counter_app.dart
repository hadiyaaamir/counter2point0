part of 'view.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Counter 2.0',
          themeMode: themeController.themeMode,
          home: AnimatedTheme(
            data: themeController.themeData,
            duration: const Duration(milliseconds: 500),
            child: const CounterScreen(),
          ),
        );
      },
    );
  }
}
