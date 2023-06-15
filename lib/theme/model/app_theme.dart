part of 'model.dart';

@immutable
class AppTheme {
  final CounterTheme counterTheme;
  final ThemeData themeData;

  const AppTheme({
    required this.counterTheme,
    required this.themeData,
  });

  factory AppTheme.light() => AppTheme(
        counterTheme: CounterThemeLight(),
        themeData: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kSeedColor),
          useMaterial3: true,
        ),
      );

  factory AppTheme.dark() => AppTheme(
        counterTheme: CounterThemeDark(),
        themeData: ThemeData.dark(useMaterial3: true),
      );

  // ThemeData get themeData => isDarkMode
  //     ? ThemeData.dark(useMaterial3: true)
  //     : ThemeData(
  //         colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  //         useMaterial3: true,
  //       );

  // AppTheme toggleTheme() =>
  //     copyWith(themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark);

  // AppTheme setTextStyle(int counterValue) => copyWith(
  //       counterTheme: isDarkMode
  //           ? CounterTheme.dark(counterValue)
  //           : CounterTheme.light(counterValue),
  //     );
}
