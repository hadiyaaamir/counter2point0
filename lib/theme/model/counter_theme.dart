part of 'model.dart';

abstract class CounterTheme {
  Color counterColor(int value);

  double counterFont(int value) {
    int numbers = kMaxValue - kMinValue + 1;
    double sizeFactor = (kMaxFont - kMinFont) / numbers;
    int myNumber = (value - kMinValue + 1);

    double fontSize = myNumber * sizeFactor + kMinFont;
    return fontSize;
  }

  int _getColorIntensity(int value) {
    int midPoint = ((kMaxValue + kMinValue) / 2).round();
    double scaleFactor = 255 / (kMaxValue - midPoint);
    int color = ((value - midPoint).abs() * scaleFactor).round();

    return color;
  }
}

class CounterThemeLight extends CounterTheme {
  @override
  Color counterColor(int value) {
    int color = super._getColorIntensity(value);
    return Color.fromARGB(255, color, 0, 0);
  }
}

class CounterThemeDark extends CounterTheme {
  @override
  Color counterColor(int value) {
    int color = super._getColorIntensity(value);
    return Color.fromARGB(255, 255, 255 - color, 255 - color);
  }
}
