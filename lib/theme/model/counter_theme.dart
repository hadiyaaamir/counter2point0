part of 'model.dart';

abstract class CounterTheme {
  Color _counterColor(int value);

  double _counterFont(int value) {
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

  TextStyle getCounterTextStyle(int value) {
    return TextStyle(
      color: _counterColor(value),
      fontSize: _counterFont(value),
    );
  }
}

class CounterThemeLight extends CounterTheme {
  @override
  Color _counterColor(int value) {
    int color = super._getColorIntensity(value);
    return Color.fromARGB(255, color, 0, 0);
  }
}

class CounterThemeDark extends CounterTheme {
  @override
  Color _counterColor(int value) {
    int color = super._getColorIntensity(value);
    return Color.fromARGB(255, 255, 255 - color, 255 - color);
  }
}
