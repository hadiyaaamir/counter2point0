part of 'controller.dart';

class CounterController {
  getFontSize(int n, Counter c) {
    int numbers = c.max - c.min + 1;
    double sizeFactor = (c.maxFont - c.minFont) / numbers;

    int myNumber = (n - c.min + 1);

    double fontSize = myNumber * sizeFactor + c.minFont;

    print('numbers: $numbers');
    print('size factor: $sizeFactor');
    print('i am $n, the ${myNumber}th number');
    print('font size: $fontSize');

    return fontSize;
  }
}
