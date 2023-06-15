part of 'controller.dart';

class CounterController extends ChangeNotifier {
  Counter _counter = const Counter(
    counter: 0,
    editing: false,
  );
  Counter get counter => _counter;

  set counter(Counter c) {
    _counter = c;
    notifyListeners();
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
