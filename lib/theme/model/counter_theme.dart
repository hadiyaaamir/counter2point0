part of 'model.dart';

class CounterTheme {
  final TextStyle counterTextStyle;

  const CounterTheme({required this.counterTextStyle});

  factory CounterTheme.dark(int counterValue) => CounterTheme(
        counterTextStyle: TextStyle(
          fontSize: _getFontSize(counterValue),
          color: _getColor(true, counterValue),
        ),
      );

  factory CounterTheme.light(int counterValue) => CounterTheme(
        counterTextStyle: TextStyle(
          fontSize: _getFontSize(counterValue),
          color: _getColor(false, counterValue),
        ),
      );

  static Color _getColor(bool inverted, int counterValue) {
    int color = _getColorIntensity(counterValue);
    return inverted
        ? Color.fromARGB(255, 255, 255 - color, 255 - color)
        : Color.fromARGB(255, color, 0, 0);
  }

  static double _getFontSize(int counterValue) {
    int numbers = kMaxValue - kMinValue + 1;
    double sizeFactor = (kMaxFont - kMinFont) / numbers;
    int myNumber = (counterValue - kMinValue + 1);

    double fontSize = myNumber * sizeFactor + kMinFont;
    return fontSize;
  }

  static int _getColorIntensity(int counterValue) {
    int midPoint = ((kMaxValue + kMinValue) / 2).round();
    double scaleFactor = 255 / (kMaxValue - midPoint);
    int color = ((counterValue - midPoint).abs() * scaleFactor).round();

    return color;
  }
}
