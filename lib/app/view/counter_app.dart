part of 'view.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final ThemeController themeController = ThemeController(counterValue: 0);
  bool changed = false;

  @override
  void dispose() {
    super.dispose();
    themeController.dispose();
  }

  @override
  void initState() {
    super.initState();

    themeController.addListener(() {
      setState(() {
        changed = !changed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      listenable: themeController,
      changed: changed,
      child: MaterialApp(
        title: 'Counter 2.0',
        themeMode: themeController.theme.themeMode,
        home: AnimatedTheme(
          data: themeController.theme.themeData,
          duration: const Duration(milliseconds: 500),
          child: const CounterScreen(),
        ),
      ),
    );
  }
}
