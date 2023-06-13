part of 'model.dart';

@immutable
class AppTheme {
  final ThemeMode themeMode;
  final TextStyle textStyle;

  const AppTheme({
    required this.themeMode,
    required this.textStyle,
  });

  AppTheme copyWith({
    ThemeMode? themeMode,
    TextStyle? textStyle,
  }) {
    return AppTheme(
      themeMode: themeMode ?? this.themeMode,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
  ThemeData get themeData => isDarkMode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        );

  AppTheme toggleTheme() =>
      copyWith(themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark);

  AppTheme setTextStyle(int n) => copyWith(textStyle: getTextStyle(n));

  TextStyle getTextStyle(int n) {
    int color = _getColor(n);
    return TextStyle(
      fontSize: _getFontSize(n),
      color: isDarkMode
          ? Color.fromARGB(
              255,
              255,
              255 - color,
              255 - color,
            )
          : Color.fromARGB(255, color, 0, 0),
    );
  }

  double _getFontSize(int n) {
    int numbers = kMaxValue - kMinValue + 1;
    double sizeFactor = (kMaxFont - kMinFont) / numbers;
    int myNumber = (n - kMinValue + 1);

    double fontSize = myNumber * sizeFactor + kMinFont;
    return fontSize;
  }

  int _getColor(int n) {
    int midPoint = ((kMaxValue + kMinValue) / 2).round();
    double scaleFactor = 255 / (kMaxValue - midPoint);
    int color = ((n - midPoint).abs() * scaleFactor).round();

    return color;
  }
}
