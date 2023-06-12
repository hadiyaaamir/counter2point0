part of 'controller.dart';

class CounterController {
  double getFontSize(int n) {
    int numbers = kMaxValue - kMinValue + 1;
    double sizeFactor = (kMaxFont - kMinFont) / numbers;

    int myNumber = (n - kMinValue + 1);

    double fontSize = myNumber * sizeFactor + kMinFont;

    return fontSize;
  }

  int getColor(int n) {
    int midPoint = ((kMaxValue + kMinValue) / 2).round();
    double scaleFactor = 255 / (kMaxValue - midPoint);
    int color = ((n - midPoint).abs() * scaleFactor).round();

    // print('number: $n');
    // print('mid point: $midPoint');
    // print('scale Factor: $scaleFactor');
    // print('red intensity: $color');

    return color;
  }
}
