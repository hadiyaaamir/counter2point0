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
}
