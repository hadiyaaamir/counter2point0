import 'package:counter2point0/app/darkmode/business_logic/modeController.dart';
import 'package:counter2point0/app/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModeController()),
      ],
      child: const MyApp(),
    ),
  );
}
