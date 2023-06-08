import 'package:counter2point0/counter/counter.dart';
import 'package:counter2point0/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = context.watch<ThemeController>().themeMode;

    return MaterialApp(
      title: 'Counter 2.0',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home: const CounterMain(),
    );
  }
}
