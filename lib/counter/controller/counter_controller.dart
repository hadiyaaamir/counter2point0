part of 'controller.dart';

class CounterController extends ChangeNotifier {
  static final CounterController _singleton = CounterController._internal();

  factory CounterController() {
    return _singleton;
  }

  CounterController._internal();

  Counter _counter = const Counter(
    counter: 0,
    editing: false,
  );
  Counter get counter => _counter;
  set counter(Counter c) {
    _counter = c;
    notifyListeners();
  }

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

  isValueValid(var value) {
    if (value == null || !RegExp(r'^-?\d+$').hasMatch(value)) {
      return "Value must be an integer";
    } else if (int.parse(value) > kMaxValue) {
      return "Value must be less than $kMaxValue";
    } else if (int.parse(value) < kMinValue) {
      return "Value must be greater than $kMinValue";
    }
    return null;
  }
}
