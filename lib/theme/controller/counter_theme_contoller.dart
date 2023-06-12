part of 'controller.dart';

class CounterThemeController {
  TextStyle getThemestyle(bool isDarkMode, int n) {
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
