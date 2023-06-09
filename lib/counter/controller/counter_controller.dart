part of 'controller.dart';

class CounterController {
  double getFontSize(int n, Counter c) {
    int numbers = c.max - c.min + 1;
    double sizeFactor = (c.maxFont - c.minFont) / numbers;

    int myNumber = (n - c.min + 1);

    double fontSize = myNumber * sizeFactor + c.minFont;

    return fontSize;
  }

  int getColor(int n, Counter c) {
    int midPoint = ((c.max + c.min) / 2).round();
    double scaleFactor = 255 / (c.max - midPoint);
    int color = ((n - midPoint).abs() * scaleFactor).round();

    // print('number: $n');
    // print('mid point: $midPoint');
    // print('scale Factor: $scaleFactor');
    // print('red intensity: $color');

    return color;
  }
}
