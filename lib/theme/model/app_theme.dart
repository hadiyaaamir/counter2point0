part of 'model.dart';

@immutable
class AppTheme {
  final ThemeMode themeMode;
  final CounterTheme counterTheme;

  const AppTheme({
    required this.themeMode,
    required this.counterTheme,
  });

  AppTheme copyWith({
    ThemeMode? themeMode,
    CounterTheme? counterTheme,
  }) {
    return AppTheme(
      themeMode: themeMode ?? this.themeMode,
      counterTheme: counterTheme ?? this.counterTheme,
    );
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
  ThemeData get themeData => isDarkMode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
          useMaterial3: true,
        );

  AppTheme toggleTheme() =>
      copyWith(themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark);

  AppTheme setTextStyle(int counterValue) => copyWith(
        counterTheme: isDarkMode
            ? CounterTheme.dark(counterValue)
            : CounterTheme.light(counterValue),
      );
}
