part of 'view.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
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
    return MaterialApp(
      title: 'Counter 2.0',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeController.themeMode,
      home: AnimatedTheme(
        data: themeController.themeData,
        duration: const Duration(milliseconds: 500),
        child: const CounterMain(),
      ),
    );
  }
}
