import 'package:counter2point0/app/root.dart';
import 'package:counter2point0/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}
